/** 
   UIApplication.h

   The "other" application class

   Copyright (C) 1996,1999,2011 Free Software Foundation, Inc.

   Author:  Scott Christley <scottc@net-community.com>
   Date: 1996
   Author: Felipe A. Rodriguez <far@ix.netcom.com>
   Date: August 1998
   Author: Richard Frith-Macdonald <richard@brainstorm.co.uk>
   Date: December 1998
   Author: Ivan Vucica <ivan@vucica.net>
   Date: October 2011

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

    AutogsdocSource: UIApplication.m

*/ 

#ifndef _GNUstep_UIKit_H_UIApplication
#define _GNUstep_UIKit_H_UIApplication
#import <GNUstepBase/GSVersionMacros.h>

#import <UIKit/UIResponder.h>
#import <UIKit/UIKitDefines.h>

@class NSArray;
@class NSAutoreleasePool;
@class NSDate;
@class NSError;
@class NSException;
@class NSMutableArray;
@class NSNotification;
@class NSString;
@class NSTimer;
/*
@class NSEvent;
@class NSGraphicsContext;
@class NSImage;
@class NSMenu;
@class NSMenuItem;
*/
@class NSPasteboard;
@class UIWindow;

@class GSInfoPanel;

enum {
  NSRunStoppedResponse = (-1000),
  NSRunAbortedResponse = (-1001),
  NSRunContinuesResponse = (-1002)
};


UIKIT_EXPORT NSString	*UIEventTrackingRunLoopMode;

@interface UIApplication : UIResponder
{
  UIEvent		*_current_event;
  UIWindow		*_key_window;
  id			_delegate;
  // 6 bits

  BOOL                  _app_is_running;
  BOOL                  _app_is_active;
  BOOL                  _app_is_launched;
  BOOL                  _windows_need_update;
  /* This autorelease pool should only be created and used by -run, with
     a single exception (which is why it is stored here as an ivar): the
     -terminate: method will destroy this autorelease pool before exiting
     the program.  */
  NSAutoreleasePool     *_runLoopPool;
}

/*
 * Class methods
 */

#if OS_API_VERSION(GS_API_MACOSX, GS_API_LATEST)
+ (void) detachDrawingThread: (SEL)selector 
		    toTarget: (id)target 
		  withObject: (id)argument;
#endif

/*
 * Creating and initializing the UIApplication
 */
+ (UIApplication*) sharedApplication;

/*
 * Instance methods
 */

/*
 * Creating and initializing the UIApplication
 */
- (void) finishLaunching;


/*
 * Running the event loop
 */
- (BOOL) isRunning;
- (void) run;
- (void) sendEvent: (UIEvent*)theEvent;
- (void) stop: (id)sender;

/*
 * Getting, removing, and posting events
 */
- (UIEvent*) currentEvent;
- (void) discardEventsMatchingMask: (unsigned int)mask
		       beforeEvent: (UIEvent*)lastEvent;
- (UIEvent*) nextEventMatchingMask: (unsigned int)mask
			 untilDate: (NSDate*)expiration
			    inMode: (NSString*)mode
			   dequeue: (BOOL)flag;
- (void) postEvent: (UIEvent*)event atStart: (BOOL)flag;

/*
 * Sending action messages
 */
- (BOOL) sendAction: (SEL)aSelector
		 to: (id)aTarget
	       from: (id)sender;


/*
 * Managing windows
 */
- (UIWindow*) keyWindow;
- (NSArray*) windows;

/*
 * Assigning a delegate
 */
- (id) delegate;
- (void) setDelegate: (id)anObject;


@end


@protocol	UIApplicationDelegate
@optional
/**
 * Invoked on notification that application has become active.
 */
- (void) applicationWillEnterForeground: (NSNotification*)aNotification;


/**
 * Invoked on notification that application has just been deactivated.
 */
- (void) applicationDidEnterBackground: (NSNotification*)aNotification;

/**
 * Invoked on notification that application has finished launching
 * ([NSApplication-finishLaunching] has completed, but no event dispatching
 * has begun. 
 */
- (void) applicationDidFinishLaunching: (NSNotification*)aNotification;

/**
 * Invoked on notification just before application terminates.  (There is
 * no opportunity to avert it now.)
 */
- (void) applicationWillTerminate:(NSNotification*)aNotification;

@end

/*
 * Notifications
 */
UIKIT_EXPORT NSString	*UIApplicationWillEnterForegroundNotification;
UIKIT_EXPORT NSString	*UIApplicationDidFinishLaunchingNotification;
UIKIT_EXPORT NSString	*UIApplicationDidEnterBackgroundNotification;
UIKIT_EXPORT NSString	*UIApplicationWillTerminateNotification;


UIKIT_EXPORT int
UIApplicationMain(int argc, const char **argv, NSString *principalClassName, NSString *delegateClassName);

#endif // _GNUstep_UIKit_H_UIApplication
