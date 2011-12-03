/** <title>UIApplication</title>

   <abstract>The one and only application class.</abstract>

   Copyright (C) 1996,1999,2011 Free Software Foundation, Inc.

   Author: Scott Christley <scottc@net-community.com>
   Date: 1996
   Author: Felipe A. Rodriguez <far@ix.netcom.com>
   Date: August 1998
   Author: Richard Frith-Macdonald <richard@brainstorm.co.uk>
   Date: December 1998
   Author: Ivan Vucica <ivan@vucica.net>
   Date: November 2011

   This file is part of the GNUstep UIKit Library.

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with this library; see the file COPYING.LIB.
   If not, see <http://www.gnu.org/licenses/> or write to the 
   Free Software Foundation, 51 Franklin Street, Fifth Floor, 
   Boston, MA 02110-1301, USA.
*/

#import "config.h"
#include <stdio.h>
#include <stdlib.h>

#import <Foundation/NSArray.h>
#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSBundle.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSError.h>
#import <Foundation/NSErrorRecoveryAttempting.h>
#import <Foundation/NSException.h>
#import <Foundation/NSFileManager.h>
#import <Foundation/NSInvocation.h>
#import <Foundation/NSNotification.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSPathUtilities.h>
#import <Foundation/NSProcessInfo.h>
#import <Foundation/NSRunLoop.h>
#import <Foundation/NSSet.h>
#import <Foundation/NSString.h>
#import <Foundation/NSTimer.h>
#import <Foundation/NSThread.h>
#import <Foundation/NSUserDefaults.h>
#import <Foundation/NSValue.h>

#ifndef LIB_FOUNDATION_LIBRARY
#import <Foundation/NSConnection.h>
#endif

#import "UIKit/UIApplication.h"

/* The -gui thread. See the comment in initialize_gnustep_backend. */
NSThread *GSUIKitThread;

/*
 * Base library exception handler
 */
static NSUncaughtExceptionHandler *defaultUncaughtExceptionHandler;


/* Get the bundle.  */
NSBundle *
GSUIKitBundle(void)
{
  /* This is the bundle from where we load localization of messages.  */
  static NSBundle *uikitBundle = nil;

  if (!uikitBundle)
    {
      /* Create the gui bundle we use to localize messages.  */
      uikitBundle = [NSBundle bundleForLibrary: @"gnustep-uikit"
			    version: OBJC_STRINGIFY(GNUSTEP_UIKIT_MAJOR_VERSION.GNUSTEP_UIKIT_MINOR_VERSION)];
      RETAIN(uikitBundle);
    }
  return uikitBundle;
}

 
@interface UIApplication (Private)
- (void) _appIconInit;
- (NSDictionary*) _notificationUserInfo;
- (void) _openDocument: (NSString*)name;
- (id) _targetForAction: (SEL)aSelector
	      keyWindow: (NSWindow *)keyWindow
	     mainWindow: (NSWindow *)mainWindow;
- (void) _windowDidBecomeKey: (NSNotification*) notification;
- (void) _windowDidBecomeMain: (NSNotification*) notification;
- (void) _windowDidResignKey: (NSNotification*) notification;
- (void) _windowWillClose: (NSNotification*) notification;
- (void) _workspaceNotification: (NSNotification*) notification;
- (NSArray *) _openFiles;
- (NSMenu *) _dockMenu;
@end

/*
 * Class variables
 */
static NSEvent *null_event;
static Class arpClass;
static NSNotificationCenter *nc;
static UIApplication *uikitApp=nil;
/**
 * <p>Every graphical GNUstep UIKit application has exactly one instance of
 * <code>UIApplication</code> (or a subclass) instantiated.  Usually this is
 * created through the +sharedApplication method.  Once created, this instance
 * is always accessible through that same method.</p>
 * 
 * <p>The UIApplication instance manages the main run loop, dispatches
 * events, and manages resources.  It sets up the connection to the window
 * server.</p>
 *
 * <p>To avoid most common needs for subclassing, UIApplication allows you to
 * specify a <em>delegate</em> that is messaged in particular situations.
 * See -delegate , -setDelegate: , and [(UIApplicationDelegate)].</p>
 *
 * <p><strong>Subclassing</strong> should be a last resort, and delegate
 * methods should be used in most cases.  However, subclassing is most
 * frequently done to implement custom event loop management by overriding
 * -run when the method described above is not sufficient, or to intercept
 * events by overriding -sendEvent: .</p>
 */
@implementation UIApplication

/*
 * Class methods
 */
+ (void) initialize
{
  if (self == [UIApplication class])
    {
      CREATE_AUTORELEASE_POOL(pool);
      /*
       * Dummy functions to fool linker into linking files that contain
       * only catagories - static libraries seem to have problems here.
       */
      extern void	GSStringDrawingDummyFunction(void);

      GSStringDrawingDummyFunction();

      [self setVersion: 1];
     
      /* Cache the NSAutoreleasePool class */
      arpClass = [NSAutoreleasePool class];
      nc = [NSNotificationCenter defaultCenter];
      [pool drain];
    }
}

// Helper method
+ (void) _invokeWithAutoreleasePool: (NSInvocation*) inv
{
  CREATE_AUTORELEASE_POOL(pool);

  [inv invoke];
  [pool drain];
}


/**
 * <p>Return the shared application instance, creating one (of the
 * receiver class) if needed.  There is (and must always be) only a
 * single shared application instance for each application.  After the
 * shared application instance has been created, you can access it
 * directly via the global variable <code>NSApp</code> (but not before!). When
 * the shared application instance is created, it is also automatically
 * initialized (that is, its <code>init</code> method is called), which
 * connects to the window server and prepares the gui library for actual
 * operation.  For this reason, you must always call <code>[UIApplication
 * sharedApplication]</code> before using any functionality of the gui
 * library - so, normally, this should be one of the first commands in
 * your program (if you use <code>UIApplicationMain()</code>, this is
 * automatically done).</p>
 *
 * <p>The shared application instance is normally an instance of
 * UIApplication; but you can subclass UIApplication, and have an
 * instance of your own subclass be created and used as the shared
 * application instance.  If you want to get this result, you need to
 * make sure the first time you call +sharedApplication is on your
 * custom UIApplication subclass (rather than on UIApplication).
 * Putting <code>[MyApplicationClass sharedApplication]</code>; as the first
 * command in your program is the recommended way. :-) If you use
 * <code>UIApplicationMain()</code>, it automatically creates the appropriate
 * instance (which you can control by editing the info dictionary of
 * the application).</p>
 *
 * <p>It is not safe to call this method from multiple threads - it would
 * be useless anyway since the whole library is not thread safe: there
 * must always be at most one thread using the gui library at a time.
 * (If you absolutely need to have multiple threads in your
 * application, make sure only one of them uses the gui [the 'drawing'
 * thread], and the other ones do not).</p>
 */
+ (UIApplication *) sharedApplication
{
  /* If the global application does not yet exist then create it.  */
  if (uikitApp == nil)
    {
      /* -init sets NSApp.  */
      [[self alloc] init];
    }
  return uikitApp;
}

/*
 * Instance methods
 */

/**
 * The real gui initialisation ... called from -init
 */
- (void) _init
{
  GSDisplayServer *srv;
  NSDictionary *attributes;
  /* Initialization must be enclosed in an autorelease pool.  */
  CREATE_AUTORELEASE_POOL(_app_init_pool);
 
  /* 
   * Set NSApp as soon as possible, since other gui classes (which
   * we refer or use in this method) might be calling [UIApplication
   * sharedApplication] during their initialization, and we want
   * those calls to succeed.  
   */
  uikitApp = self;

  /* Connect to our window server.  */
  srv = [GSDisplayServer serverWithAttributes: nil];
  RETAIN(srv);
  [GSDisplayServer setCurrentServer: srv];

  /* Create a default context with the attributes of the main screen.  */
/*
  attributes = [[NSScreen mainScreen] deviceDescription];
  _default_context = [NSGraphicsContext graphicsContextWithAttributes: attributes];
  RETAIN(_default_context);
  [NSGraphicsContext setCurrentContext: _default_context];
*/
  /* Initialize font manager.  */
/*
  [NSFontManager sharedFontManager];

  _hidden = [[NSMutableArray alloc] init];
  _inactive = [[NSMutableArray alloc] init];
  _unhide_on_activation = YES;
  _app_is_hidden = NO;
*/
  /* Ivar already automatically initialized to NO when the app is
     created.  */
  //_app_is_active = NO;
  //_main_menu = nil;
/*
  _windows_need_update = YES;
*/

  /* Save the base library exception handler */
  defaultUncaughtExceptionHandler = NSGetUncaughtExceptionHandler();
  /* Set a new exception handler for the gui library.  */
/*
  NSSetUncaughtExceptionHandler(_NSAppKitUncaughtExceptionHandler);
 */
  _listener = [GSServicesManager newWithApplication: self];

  /* NSEvent doesn't use -init so we use +alloc instead of +new.  */
  _current_event = [NSEvent alloc]; // no current event
  null_event = [NSEvent alloc];    // create dummy event

  /* We are the end of responder chain.  */
  [self setNextResponder: nil];

  [_app_init_pool drain];
}


/** 
 * This method initializes an UIApplication instance.  It sets the
 * shared application instance to be the receiver, and then connects
 * to the window server and performs the actual gui library
 * initialization.
 *
 * If there is a already a shared application instance, calling this
 * method results in an assertion (and normally program abortion/crash).
 *
 * It is recommended that you /never/ call this method directly from
 * your code!  It's called automatically (and only once) by
 * [UIApplication sharedApplication].  You might override this method
 * in subclasses (make sure to call super's :-), then your overridden
 * method will automatically be called (guaranteed once in the
 * lifetime of the application) when you call [MyApplicationClass
 * sharedApplication].
 *
 * If you call this method from your code (which we discourage you
 * from doing), it is <em>your</em> responsibility to make sure it is called
 * only once (this is according to the openstep specification).  Since
 * +sharedApplication automatically calls this method, making also
 * sure it calls it only once, you definitely want to use
 * +sharedApplication instead of calling -init directly.  
 */
- (id) init
{
  /*
   * Calling -init twice is a bug in the program.
   * +sharedApplication automatically makes sure it
   * never calls -init more than once, and programmers should normally
   * use +sharedApplication in programs.
   *
   * Please refrain from trying to have this method work with multiple
   * calls (such as returning NSApp instead of raising an assertion).
   * No matter what you do, you can't protect subclass -init custom
   * code from multiple executions by changing the implementation here
   * - so it's just simpler and cleaner that multiple -init executions
   * are always forbidden, and subclasses inherit exactly the same
   * kind of multiple execution protection as the superclass has, and
   * initialization code behaves always in the same way for this class
   * and for subclasses.
   */
  NSAssert (uikitApp == nil, _(@"[UIApplication -init] called more than once"));

  /*
   * The appkit should run in the main thread ... so to be sure we perform
   * all the initialisation there.
   */
  [self performSelectorOnMainThread: @selector(_init)
			 withObject: self
		      waitUntilDone: YES];
  return uikitApp;
}

/**
 * <p>Activates the application, and takes care
 * of a few other startup tasks.
 * If you override this method, be sure to call <em>super</em>.</p>
 *
 * <p>The -run method calls this the first time it is called, before starting
 * the event loop for the first time.</p>
 */
- (void) finishLaunching
{
  NSUserDefaults	*defs = [NSUserDefaults standardUserDefaults];
  NSString		*filePath;
  NSArray		*windows_list;
  unsigned		count;
  unsigned		i;
  BOOL			hadDuplicates = NO;
  BOOL			didAutoreopen = NO;
  NSArray               *files = nil;

#if 0
// code disabled until it can be reviewed
  /* Register our listener to incoming services requests etc. */
  [_listener registerAsServiceProvider];

  /*
   * Establish the current key and main windows.  We need to do this in case
   * the windows were created and set to be key/main earlier - before the
   * app was active.
   */
  windows_list = [self windows];
  count = [windows_list count];
  for (i = 0; i < count; i++)
    {
      NSWindow	*win = [windows_list objectAtIndex: i];

      if ([win isKeyWindow] == YES)
	{
	  if (_key_window == nil)
	    {
	      _key_window = win;
	    }
	  else
	    {
	      hadDuplicates = YES;
	      NSDebugLog(@"Duplicate keyWindow ignored");
	      [win resignKeyWindow];
	    }
	}
      if ([win isMainWindow] == YES)
	{
	  if (_main_window == nil)
	    {
	      _main_window = win;
	    }
	  else
	    {
	      hadDuplicates = YES;
	      NSDebugLog(@"Duplicate mainWindow ignored");
	      [win resignMainWindow];
	    }
	}
    }

  /*
   * If there was more than one window set as key or main, we must make sure
   * that the one we have recorded is the real one by making it become key/main
   * again.
   */
  if (hadDuplicates)
    {
      [_main_window resignMainWindow];
      [_main_window becomeMainWindow];
      [_main_window orderFrontRegardless];
      [_key_window resignKeyWindow];
      [_key_window becomeKeyWindow];
      [_key_window orderFrontRegardless];
    }

  // Make sure there is one designated main window
  if (_main_window == nil)
    {
      for (i = 0; i < count; i++)
        {
          NSWindow	*win = [windows_list objectAtIndex: i];

          if ([win isVisible] && [win canBecomeMainWindow])
            {
              _main_window = win;
              break;
            }
        }
    }

  /* Register self as observer to window events. */
  [nc addObserver: self selector: @selector(_windowWillClose:)
      name: NSWindowWillCloseNotification object: nil];
  [nc addObserver: self selector: @selector(_windowDidBecomeKey:)
      name: NSWindowDidBecomeKeyNotification object: nil];
  [nc addObserver: self selector: @selector(_windowDidBecomeMain:)
      name: NSWindowDidBecomeMainNotification object: nil];
  [nc addObserver: self selector: @selector(_windowDidResignKey:)
      name: NSWindowDidResignKeyNotification object: nil];
  [nc addObserver: self selector: @selector(_windowDidResignMain:)
      name: NSWindowDidResignMainNotification object: nil];

  /* register as observer for hide/unhide notifications */
  [[[NSWorkspace sharedWorkspace] notificationCenter]
    addObserver: self selector: @selector(_workspaceNotification:)
      name: GSHideOtherApplicationsNotification object: nil];
  [[[NSWorkspace sharedWorkspace] notificationCenter]
    addObserver: self selector: @selector(_workspaceNotification:)
      name: GSUnhideAllApplicationsNotification object: nil];

  // Don't activate the application, when the delegate hid it
  if (![self isHidden])
    {
      [self activateIgnoringOtherApps: YES];
    }

  /*
   * Instantiate the NSDocumentController if we are a doc-based app
   * and eventually reopen all autosaved documents
   */
  sdc = [NSDocumentController sharedDocumentController];
  if ([[sdc documentClassNames] count] > 0)
    {
      didAutoreopen = [sdc _reopenAutosavedDocuments];
    }

  /*
   *	Now check to see if we were launched with arguments asking to
   *	open a file.  We permit some variations on the default name.
   */

  if ((files = [self _openFiles]) != nil)
    {
      NSEnumerator *en = [files objectEnumerator];

      while ((filePath = (NSString *)[en nextObject]) != nil)
	{
	  [_listener application: self openFile: filePath];
	}
    } 
  else if ((filePath = [defs stringForKey: @"GSFilePath"]) != nil
    || (filePath = [defs stringForKey: @"NSOpen"]) != nil)
    {
      [_listener application: self openFile: filePath];
    }
  else if ((filePath = [defs stringForKey: @"GSTempPath"]) != nil)
    {
      [_listener application: self openTempFile: filePath];
    }
  else if ((filePath = [defs stringForKey: @"NSPrint"]) != nil)
    {
      [_listener application: self printFile: filePath];
      [self terminate: self];
    }
  else if (!didAutoreopen && ![defs boolForKey: @"autolaunch"])
    {
      // For document based applications we automatically open a fresh document
      // unless denied by the delegate. For non-document based applications we
      // open a fresh document only when requested by the delegate.
      // Note: We consider an application document based if the shared document
      // controller reports at least one editable type.
      BOOL docBased =
	[[sdc documentClassNames] count] > 0 && [sdc defaultType] != nil;
      BOOL shouldOpen = docBased ? YES : NO;

      if ([_delegate respondsToSelector:
                       @selector(applicationShouldOpenUntitledFile:)])
        {
	  shouldOpen = [_delegate applicationShouldOpenUntitledFile: self];
	}
      if (shouldOpen)
	{
	  if (docBased)
	    {
	      NSError *err = nil;
	      if ([sdc openUntitledDocumentAndDisplay: YES error: &err] == nil)
		{
		  [sdc presentError: err];
		}
	    }
	  else if ([_delegate respondsToSelector:
                                @selector(applicationOpenUntitledFile:)])
	    {
	      [_delegate applicationOpenUntitledFile: self];
	    }
        }
    }
#endif
}

/*
 * Posts <code>UIApplicationDidFinishLaunchingNotification</code>.
 *
 * <p>The -run method calls this the first time it is called, before starting
 * the event loop for the first time and after calling finishLaunching.</p>
 */  
- (void) _didFinishLaunching
{
  /* finish the launching post notification that launching has finished */
  [nc postNotificationName: UIApplicationDidFinishLaunchingNotification
		    object: self];
#if 0
// Workspace/Springboard should be notified.
// Disabled until we have a Workspace/Springboard!
  NS_DURING
    {
      [[[NSWorkspace sharedWorkspace] notificationCenter]
          postNotificationName: NSWorkspaceDidLaunchApplicationNotification
          object: [NSWorkspace sharedWorkspace]
          userInfo: [self _notificationUserInfo]];
    }
  NS_HANDLER
    {
      NSLog (_(@"Problem during launch app notification: %@"),
             [localException reason]);
      [localException raise];
    }
  NS_ENDHANDLER
#endif
}

- (void) dealloc
{
  GSDisplayServer *srv = GSServerForWindow(_app_icon_window);

  if (srv == nil)
    {
      srv = GSCurrentServer();
    }
/*
  [[[NSWorkspace sharedWorkspace] notificationCenter]
    removeObserver: self];
*/
  [nc removeObserver: self];
/*
  RELEASE(_hidden);
  RELEASE(_inactive);
  RELEASE(_listener);
*/
  RELEASE(null_event);
  RELEASE(_current_event);

#if 0
// Disabled until we figure out if we really need modal sessions in UIKit
// Probably not!
  /* We may need to tidy up nested modal session structures. */
  while (_session != 0)
    {
      NSModalSession tmp = _session;

      _session = tmp->previous;
      NSZoneFree(NSDefaultMallocZone(), tmp);
    }
#endif

#if 0
// Did not yet figure out gfx.
  /* Destroy the default context */
  [NSGraphicsContext setCurrentContext: nil];
  DESTROY(_default_context);
#endif
  /* Close the server */
  [srv closeServer];
  DESTROY(srv);

  [super dealloc];
}

/**
 * Returns whether this app is the currently active GNUstep UIKit application.
 */
- (BOOL) isActive
{
  return _app_is_active;
}

#define NSLogUncaughtExceptionMask 1
#define NSHandleUncaughtExceptionMask 2
#define NSLogUncaughtSystemExceptionMask 4
#define NSHandleUncaughtSystemExceptionMask 8
#define NSLogRuntimeErrorMask 16
#define NSLogUncaughtRuntimeErrorMask 32

/**
 * Private method to handle an exception which occurs in the application runloop.
 */
- (void) _handleException: (NSException *)exception
{
  int mask = [[NSUserDefaults standardUserDefaults] integerForKey: @"NSExceptionHandlerMask"];

  /**
   * If we are in debug mode, then rethrow the exception so that
   * the application can be stopped.
   **/

  // log the exception.
  if(mask & NSLogUncaughtExceptionMask) 
    {
      [self reportException: exception];
    }

  // allow the default handler to handle the exception.
  if(mask & NSHandleUncaughtExceptionMask) 
    {
      [exception raise];
    }
}

/*
 * Running the main event loop
 */

/**
 * <p>This method first calls -finishLaunching (if this is the first time -run)
 * has been called, then starts the main event loop of the application which
 * continues until -terminate: or -stop: is called.</p>
 *
 * <p>At each iteration, at most one event is dispatched, the main and services
 * menus are sent [NSMenu-update] messages, and -updateWindows is possibly
 * called if this has been flagged as necessary.</p>
 */
- (void) run
{
  NSEvent *e;
  id distantFuture = [NSDate distantFuture];     /* Cache this, safe */

  if (_runLoopPool != nil)
    {
      [NSException raise: NSInternalInconsistencyException
		   format: @"NSApp's run called recursively"];
    }

  /*
   *  Set this flag here in case the application is actually terminated
   *  inside -finishLaunching.
   */
  _app_is_running = YES;

  if (_app_is_launched == NO)
    {
      _app_is_launched = YES;
      IF_NO_GC(_runLoopPool = [arpClass new]);

      [self finishLaunching];
      [self _didFinishLaunching];

      DESTROY(_runLoopPool);
    }
 
  while (_app_is_running)
    {
      IF_NO_GC(_runLoopPool = [arpClass new]);

      e = [self nextEventMatchingMask: NSAnyEventMask
		untilDate: distantFuture
		inMode: NSDefaultRunLoopMode
		dequeue: YES];
      
      if (e != nil)
	{
	  NSEventType	type = [e type];

	  // Catch and report any uncaught exceptions.
	  NS_DURING
	    {	  	  
	      [self sendEvent: e];

	      // update (en/disable) the services menu's items
	      if (type != NSPeriodic && type != NSMouseMoved)
		{
		  [_listener updateServicesMenu];
		  [_main_menu update];
		}
	    }
	  NS_HANDLER
	    {
	      [self _handleException: localException];
	    }
	  NS_ENDHANDLER;
	}
      
      DESTROY (_runLoopPool);
    }

  /* Every single non trivial line of code must be enclosed into an
     autorelease pool.  Create an autorelease pool here to wrap
     synchronize and the NSDebugLog.  */
  IF_NO_GC(_runLoopPool = [arpClass new]);

  [[NSUserDefaults standardUserDefaults] synchronize];
  DESTROY (_runLoopPool);
}

/**
 *  Returns whether the event loop managed by -run is currently active.
 */
- (BOOL) isRunning
{
  return _app_is_running;
}

/**
 * Stops the main run loop, as well as a modal session if it is running.
 */
- (void) stop: (id)sender
{
    {
      _app_is_running = NO;
      /*
       * add dummy event to queue to assure loop cycles
       * at least one more time
       */
      DPSPostEvent(GSCurrentServer(), null_event, NO);
    }
}


/*
 * Getting, removing, and posting events
 */

/* Private method used by GSDragView to dispatch drag events as Cocoa does. */
- (void) _postAndSendEvent: (NSEvent *)anEvent
{
  ASSIGN(_current_event, anEvent);
  [self sendEvent: anEvent];
}

/**
 * Called by -run to dispatch events that are received according to AppKit's
 * forwarding conventions.  You rarely need to invoke this directly.  If you
 * want to synthesize an event for processing, call -postEvent:atStart: .
 */
- (void) sendEvent: (UIEvent *)theEvent
{
#if 0
// None of these are types of UIEvent!
// Figure out what to do.
  UIEventType type;

  type = [theEvent type];
  switch (type)
    {
      case NSPeriodic:	/* NSApplication traps the periodic events	*/
	break;

      case NSKeyDown:
	{
	  NSDebugLLog(@"NSEvent", @"send key down event\n");
	  /* Key equivalents must be looked up explicitly in the Services menu
	     after checking the main menu, as NSMenu's -performKeyEquivalent:
	     ignores the Services menu. See the comment in that method for a
	     rationale. */
	  if ([[self keyWindow] performKeyEquivalent: theEvent] == NO
	    && [[self mainMenu] performKeyEquivalent: theEvent] == NO
	    && [[self servicesMenu] performKeyEquivalent: theEvent] == NO)
	    {
	      [[theEvent window] sendEvent: theEvent];
	    }
	  break;
	}

      case NSKeyUp:
	{
	  NSDebugLLog(@"NSEvent", @"send key up event\n");
	  [[theEvent window] sendEvent: theEvent];
	  break;
	}

      default:	/* pass all other events to the event's window	*/
	{
	  NSWindow	*window = [theEvent window];

	  if (!theEvent)
	    NSDebugLLog(@"NSEvent", @"NSEvent is nil!\n");
	  if (type == NSMouseMoved)
	    NSDebugLLog(@"NSMotionEvent", @"Send move (%d) to %@", 
			type, window);
	  else
	    NSDebugLLog(@"NSEvent", @"Send NSEvent type: %d to %@", 
			type, window);
	  if (window)
	    [window sendEvent: theEvent];
	  else if (type == NSRightMouseDown)
	    [self rightMouseDown: theEvent];
	}
    }
#endif
}

/**
 * Returns the most recent event -run pulled off the event queue.
 */
- (NSEvent*) currentEvent
{
  return _current_event;
}

/**
 * Drop events matching mask from the queue, before but not including
 * lastEvent.  The mask is a bitwise AND of event mask constants.
 * See (EventType) .  Use <code>NSAnyEventMask</code> to discard everything
 * up to lastEvent.
 */
- (void) discardEventsMatchingMask: (unsigned int)mask
		       beforeEvent: (NSEvent *)lastEvent
{
  DPSDiscardEvents(GSCurrentServer(), mask, lastEvent);
}

/**
 * Return the next event matching mask from the queue, dequeuing if flag is
 * YES.  Intervening events are NOT dequeued.  If no matching event is on the
 * queue, will wait for one until expiration, returning nil if none found.
 * See (EventType) for the list of masks.
 */
- (NSEvent*) nextEventMatchingMask: (unsigned int)mask
			 untilDate: (NSDate*)expiration
			    inMode: (NSString*)mode
			   dequeue: (BOOL)flag
{
  NSEvent	*event;

  if (_windows_need_update)
    {
      [self updateWindows];
    }
  if (!expiration)
    expiration = [NSDate distantPast];

  if (flag)
    event = DPSGetEvent(GSCurrentServer(), mask, expiration, mode);
  else
    event = DPSPeekEvent(GSCurrentServer(), mask, expiration, mode);

  if (event == null_event)
    {
      // Never return the null_event
      event = nil;
    }

  if (event)
    {
IF_NO_GC(NSAssert([event retainCount] > 0, NSInternalInconsistencyException));
      /*
       * If we are not in a tracking loop, we may want to unhide a hidden
       * because the mouse has been moved.
       */
      if (mode != NSEventTrackingRunLoopMode)
	{
	  _windows_need_update = YES;
/*
	  if ([NSCursor isHiddenUntilMouseMoves])
	    {
	      NSEventType type = [event type];

	      if ((type == NSLeftMouseDown) || (type == NSLeftMouseUp)
		|| (type == NSOtherMouseDown) || (type == NSOtherMouseUp)
		|| (type == NSRightMouseDown) || (type == NSRightMouseUp)
		|| (type == NSMouseMoved))
		{
		  [NSCursor setHiddenUntilMouseMoves: NO];
		}
	    }
 */
	}

      if (flag)
        ASSIGN(_current_event, event);
    }
  return event;
}

/**
 * Add an event to be processed by the app, either at end or at beginning
 * (next up) if flag is YES.  This provides a way to provide synthetic input
 * to an application, or, for whatever reason, to allow a real event to be
 * re-dispatched.
 */
- (void) postEvent: (NSEvent *)event atStart: (BOOL)flag
{
  DPSPostEvent(GSCurrentServer(), event, flag);
}

/**
 * Sends the aSelector message to the receiver returned by the
 * -targetForAction:to:from: method (to which the aTarget and sender
 * arguments are passed).<br />
 * The method in the receiver must expect a single argument ...
 * the sender.<br />
 * Any value returned by the method in the receiver is ignored.<br />
 * This method returns YES on success, NO on failure (when no receiver
 * can be found for aSelector).
 */
- (BOOL) sendAction: (SEL)aSelector to: (id)aTarget from: (id)sender
{
#if 0
// targetForAction:to:from: is not used on the fruity implementation.
// We'll probably use it, but let's leave this commented out for now.
  id resp = [self targetForAction: aSelector to: aTarget from: sender];

  if (resp != nil)
    {
      IMP actionIMP = [resp methodForSelector: aSelector];

      if (0 != actionIMP)
        {
          actionIMP(resp, aSelector, sender);
          return YES;
        }
    }
#endif
  return NO;
}

#if 0
// The fruity implementation does not have this.
// Commented out until it is studied.

/**
 * If theTarget responds to theAction it is returned, otherwise
 * the application searches for an object which will handle
 * theAction and returns the first object found.<br />
 * Returns nil on failure.
 */
- (id) targetForAction: (SEL)theAction to: (id)theTarget from: (id)sender
{
  /*
   * If target responds to the selector then have it perform it.
   */
  if (theTarget && [theTarget respondsToSelector: theAction])
    {
      return theTarget;
    }
  else if ([sender isKindOfClass: [NSToolbarItem class]])
    {
      /* Special case for toolbar items which must look up the target in the
         responder chain of the window containing their toolbar not in the key
         or main window.
         Note: If (and only if) the toolbar's window is key window we must
         pass it as such to _targetForAction:... so that toolbar items in a
         modal dialog panel work.
       */
      NSWindow *toolbarWindow =
          [[[(NSToolbarItem *)sender toolbar] _toolbarView] window];
      NSWindow *keyWindow = [self keyWindow];
      if (keyWindow != toolbarWindow)
        keyWindow = nil;
      return [self _targetForAction: theAction
                   keyWindow: keyWindow
                   mainWindow: toolbarWindow];
    }
  else
    {
      return [self targetForAction: theAction];
    }
}

/** 
 * <p>
 *   Returns the target object that will respond to aSelector, if any. The
 *   method first checks if any of the key window's first responders, the
 *   key window or its delegate responds. Next it checks the main window in
 *   the same way. Finally it checks the receiver (NSApplication) and its
 *   delegate.
 * </p>
 */
- (id) targetForAction: (SEL)aSelector
{
  return [self _targetForAction: aSelector
	       keyWindow: [self keyWindow]
	       mainWindow: [self mainWindow]];
}
#endif

#if 0
// Not in fruity implementation, commented out for now.
/**
 * Attempts to perform aSelector using [NSResponder-tryToPerform:with:]
 * and if that is not possible, attempts to get the application
 * delegate to perform the aSelector.<br />
 * Returns YES if an object was found to perform aSelector, NO otherwise.
 */
- (BOOL) tryToPerform: (SEL)aSelector with: (id)anObject
{
  if ([super tryToPerform: aSelector with: anObject] == YES)
    {
      return YES;
    }
  if (_delegate != nil && [_delegate respondsToSelector: aSelector])
    {
      IMP actionIMP = [_delegate methodForSelector: aSelector];
      if (0 != actionIMP)
        {
          actionIMP(_delegate, aSelector, anObject);
          return YES;
        }
    }
  return NO;
}
#endif

/*
 * Managing windows
 */

/**
 * Returns current key window.  If this app is active, one window should be
 * key.  If this app is not active, nil should be returned.  The key window
 * is the one that will receive keyboard input.
 */
- (UIWindow*) keyWindow
{
  return _key_window;
}


/**
 *  Returns array of app's visible and invisible windows.
 */
- (NSArray*) windows
{
  // TODO we cannot use gnustep-gui method here
#if 0
  return GSAllWindows();
#endif
}

/**
 * Return an object capable of sending and receiving the specified sendType
 * and returnType in a services interaction.  NSApp is generally the last
 * responder to get this request, and the implementation passes it on to the
 * delegate if it handles it and is not itself an [NSResponder], or returns
 * nil otherwise.
 */
- (id) validRequestorForSendType: (NSString *)sendType
		      returnType: (NSString *)returnType
{
  if (_delegate != nil && ![_delegate isKindOfClass: [UIResponder class]]
    && [_delegate respondsToSelector:
                    @selector(validRequestorForSendType:returnType:)])
    return [_delegate validRequestorForSendType: sendType
				     returnType: returnType];

  return nil;
}

#if 0
// TODO no NSGraphicsContext equivalent yet
/**
 *  Returns the default drawing context for the app.
 */
- (NSGraphicsContext *) context
{
  return _default_context;
}
#endif

/**
 *  NSLogs an exception without raising it.
 */
- (void) reportException: (NSException *)anException
{
  if (anException)
    NSLog (_(@"reported exception - %@"), anException);
}

/**
 * NOTE: Documentation not updated for UIKit.
 * Returns the application's delegate, as set by the -setDelegate: method.<br/>
 * <p>The application delegate will automatically be sent various
 * notifications (as long as it implements the appropriate methods)
 * when application events occur.  The method to handle each of these
 * notifications has name mirroring the notification name, so for instance
 * an <em>NSApplicationDidBecomeActiveNotification</em> is handled by an
 * <code>applicationDidBecomeActive:</code> method.
 * </p> 
 * <list>
 *   <item>NSApplicationDidBecomeActiveNotification</item>
 *   <item>NSApplicationDidFinishLaunchingNotification</item>
 *   <item>NSApplicationDidHideNotification</item>
 *   <item>NSApplicationDidResignActiveNotification</item>
 *   <item>NSApplicationDidUnhideNotification</item>
 *   <item>NSApplicationDidUpdateNotification</item>
 *   <item>NSApplicationWillBecomeActiveNotification</item>
 *   <item>NSApplicationWillFinishLaunchingNotification</item>
 *   <item>NSApplicationWillHideNotification</item>
 *   <item>NSApplicationWillResignActiveNotification</item>
 *   <item>NSApplicationWillTerminateNotification</item>
 *   <item>NSApplicationWillUnhideNotification</item>
 *   <item>NSApplicationWillUpdateNotification</item>
 * </list>
 * <p>The delegate is also sent various messages to ask for authorisation
 * to perform actions, or to ask it to perform actions (again, as long
 * as it implements the appropriate methods).
 * </p>
 * <list>
 *   <item>application:shouldTerminateAfterLastWindowClosed:</item>
 *   <item>application:shouldOpenUntitledFile:</item>
 *   <item>application:openFile:</item>
 *   <item>application:openFileWithoutUI:</item>
 *   <item>application:openTempFile:</item>
 *   <item>application:openUntitledFile:</item>
 *   <item>application:shouldOpenUntitledFile:</item>
 *   <item>application:printFile:</item>
 *   <item>application:shouldTerminate:</item>
 *   <item>application:shouldTerminateAfterLastWindowClosed:</item>
 * </list>
 * <p>The delegate is also called upon to respond to any actions which
 *   are not handled by a window, a window delgate, or by the application
 *   object itself.  This is controlled by the -targetForAction: method. 
 * </p>
 * <p>Finally, the application delegate is responsible for handling
 *   messages sent to the application from remote processes (see the
 *   section documenting distributed objects for [NSPasteboard]).
 * </p>
 * <p>See -setDelegate: and [(GSAppDelegateProtocol)] for more information.</p>
 */
- (id) delegate
{
  return _delegate;
}

/**
 * Sets the delegate of the application to anObject.<br />
 * <p><em>Beware</em>, this does not retain anObject, so you must be sure
 * that, in the event of anObject being deallocated, you
 * stop it being the application delagate by calling this
 * method again with another object (or nil) as the argument.
 * </p>
 * <p>See -delegate and [(GSAppDelegateProtocol)] for more information.</p>
 */
- (void) setDelegate: (id)anObject
{
  if (_delegate)
    [nc removeObserver: _delegate name: nil object: self];
  _delegate = anObject;

#define SET_DELEGATE_NOTIFICATION(notif_name) \
  if ([_delegate respondsToSelector: @selector(application##notif_name:)]) \
    [nc addObserver: _delegate \
      selector: @selector(application##notif_name:) \
      name: UIApplication##notif_name##Notification object: self]

  SET_DELEGATE_NOTIFICATION(WillEnterForeground);
  SET_DELEGATE_NOTIFICATION(DidEnterBackground);
  SET_DELEGATE_NOTIFICATION(DidFinishLaunching);
  SET_DELEGATE_NOTIFICATION(WillTerminate);
}

/*
 * Methods for scripting
 */


@end /* UIApplication */


@implementation	UIApplication (Private)

- (NSDictionary*) _notificationUserInfo
{
  NSString	*path;
  NSString	*port;
  NSNumber	*processIdentifier;
  NSDictionary	*userInfo;

  processIdentifier = [NSNumber numberWithInt:
    [[NSProcessInfo processInfo] processIdentifier]];
  port = [(GSServicesManager*)_listener port];
  path = [[NSBundle mainBundle] bundlePath];
  if (port == nil)
    {
      if (path == nil)
	{
	  userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
	    processIdentifier, @"NSApplicationProcessIdentifier",
	    nil];
	}
      else
	{
	  userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
	    path, @"NSApplicationPath",
	    processIdentifier, @"NSApplicationProcessIdentifier",
	    nil];
	}
    }
  else if (path == nil)
    {
      userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
	port, @"NSApplicationName",
	processIdentifier, @"NSApplicationProcessIdentifier",
	nil];
    }
  else
    {
      userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
	port, @"NSApplicationName",
	path, @"NSApplicationPath",
	processIdentifier, @"NSApplicationProcessIdentifier",
	nil];
    }
  return userInfo;
}

#if 0
/// TODO study what this is used for
- (id) _targetForAction: (SEL)aSelector
	      keyWindow: (NSWindow *)keyWindow
	     mainWindow: (NSWindow *)mainWindow
{
  NSDocumentController	*sdc;
  id resp, delegate;
  NSWindow *window;

  if (aSelector == NULL)
      return nil;

  /* if we have a key window, start looking in its responder chain, ... */
  if (keyWindow != nil)
    {
      window = keyWindow;
    }
  /* ... otherwise in the main window's responder chain */
  else
    {
      if (_session != 0)
	return nil;
      window = mainWindow;
    }

  if (window != nil)
    {
      NSDocumentController	*sdc;

      /* traverse the responder chain including the window's delegate */
      resp = [window firstResponder];
      while (resp != nil && resp != self)
        {
	  if ([resp respondsToSelector: aSelector])
	    {
	      return resp;
	    }
	  if (resp == window)
	    {
	      delegate = [window delegate];
	      if ([delegate respondsToSelector: aSelector])
	        {
		  return delegate;
		}
	    }
	  resp = [resp nextResponder];
	}

      /* in a document based app try the window's document */
      sdc = [NSDocumentController sharedDocumentController];
      if ([[sdc documentClassNames] count] > 0)
        {
	  resp = [sdc documentForWindow: window];

	  if (resp != nil && [resp respondsToSelector: aSelector])
	    {
	      return resp;
	    }
	}
    }

  /* if we've found no target in the key window start over without key window */
  if (keyWindow != nil)
    {
      if (_session != 0)
	return nil;
      if (mainWindow != nil && mainWindow != keyWindow)
	return [self _targetForAction: aSelector
		     keyWindow: nil
		     mainWindow: mainWindow];
    }

  /* try the shared application imstance and its delegate */
  if ([self respondsToSelector: aSelector])
    {
      return self;
    }

  if (_delegate != nil && [_delegate respondsToSelector: aSelector])
    {
      return _delegate;
    }

  /* 
   * Try the NSApplication's responder list to determine if any of them 
   * respond to the selector.
   */
  resp = [self nextResponder];
  while(resp != nil)
    {
      if([resp respondsToSelector: aSelector])
	{
	  return resp;
	}
      resp = [resp nextResponder];
    }

  /* as a last resort in a document based app, try the document controller */
  sdc = [NSDocumentController sharedDocumentController];
  if ([[sdc documentClassNames] count] > 0
    && [sdc respondsToSelector: aSelector])
    {
      return [NSDocumentController sharedDocumentController];
    }

  /* give up */
  return nil;
}
#endif
- (void) _windowDidBecomeKey: (NSNotification*) notification
{
  id	obj = [notification object];

  if (_key_window == nil && [obj isKindOfClass: [UIWindow class]])
    {
      _key_window = obj;
/*
      [_main_menu update];
*/
    }
  else if (_key_window != obj)
    {
      NSLog(@"Bogus attempt to set key window");
    }
}

- (void) _windowDidResignKey: (NSNotification*) notification
{
  id	obj = [notification object];

  if (_key_window == obj)
    {
      _key_window = nil;
/*
      [NSCursor setHiddenUntilMouseMoves: NO];
 */
    }
  else
    {
      NSLog(@"Bogus attempt to resign key window");
    }
}

#if 0
// Reenable when we have Springboard/Workspace
- (void) _workspaceNotification: (NSNotification*) notification
{
  NSString	*name = [notification name];
  NSDictionary	*info = [notification userInfo];

  /*
   * Handle hiding and unhiding of this app if necessary.
   */
  if ([name isEqualToString: GSUnhideAllApplicationsNotification] == YES)
    {
      [self unhideWithoutActivation];
    }
  else if ([name isEqualToString: GSHideOtherApplicationsNotification] == YES)
    {
      NSString	*port = [info objectForKey: @"NSApplicationName"];

      if ([port isEqual: [[GSServicesManager manager] port]] == NO)
	{
	  [self hide: self];
	}
    }
}
#endif


@end // UIApplication (Private)


@implementation UIApplication (GSGUIInternal)

- (void) _windowWillDealloc: (UIWindow *)window
{
  if (window == _key_window)
    _key_window = nil;
}

@end

