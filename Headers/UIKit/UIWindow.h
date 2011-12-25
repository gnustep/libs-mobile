/** <title>UIWindow</title>

   <abstract>The window class</abstract>

   Copyright (C) 2011 Free Software Foundation, Inc.

   Author: Gregory Casamento
   Date: January 2011
   Author: Fred Kiefer
   Date: Febuary 2011

   This file is part of the GNUstep UIKit/Mobile Library.

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

#import <Foundation/Foundation.h>

@class UIViewController, UIScreen, UIEvent;

typedef CGFloat UIWindowLevel;
const UIWindowLevel UIWindowLevelNormal = 0;
const UIWindowLevel UIWindowLevelAlert = 1;
const UIWindowLevel UIWindowLevelStatusBar = 2;

NSString *const UIKeyboardFrameBeginUserInfoKey;
NSString *const UIKeyboardFrameEndUserInfoKey;
NSString *const UIKeyboardAnimationDurationUserInfoKey;
NSString *const UIKeyboardAnimationCurveUserInfoKey;
   
// Deprecated in iOS 3.2 and later.
NSString *const UIKeyboardCenterBeginUserInfoKey;
NSString *const UIKeyboardCenterEndUserInfoKey;
NSString *const UIKeyboardBoundsUserInfoKey;

NSString *const UIWindowDidBecomeVisibleNotification;
NSString *const UIWindowDidBecomeHiddenNotification;
NSString *const UIWindowDidBecomeKeyNotification;
NSString *const UIWindowDidResignKeyNotification;
NSString *const UIKeyboardWillShowNotification;
NSString *const UIKeyboardDidShowNotification;
NSString *const UIKeyboardWillHideNotification;
NSString *const UIKeyboardDidHideNotification;

@interface UIWindow : UIView
{
  UIViewController *rootViewController;
  UIScreen *screen;
  UIWindowLevel windowLevel;
  BOOL keyWindow;
}
/*
 * Properties...
 */
//@property(nonatomic, readonly, getter=isKeyWindow) BOOL keyWindow
- (BOOL) isKeyWindow;

//@property(nonatomic,retain) UIViewController *rootViewController
- (void) setRootViewController: (UIViewController *)aViewController;
- (UIViewController *) rootViewController;

//@property (nonatomic,retain) UIScreen *screen
- (UIScreen *) screen;
- (void) setScreen; (UIScreen *)screen;

//@property(nonatomic) UIWindowLevel windowLevel
- (UIWindowLevel) windowLevel;
- (void) setWindowLevel: (UIWindowLevel)windowLevel;

/*
 * Methods
 */
// Becoming and resigning key...
- (void) becomeKeyWindow;
- (void) makeKeyAndVisible;
- (void) makeKeyWindow;
- (void) resignKeyWindow;

// Coordinate conversion...
- (CGPoint) convertPoint: (CGPoint)point fromWindow: (UIWindow *)window;
- (CGPoint) convertPoint: (CGPoint)point toWindow: (UIWindow *)window;
- (CGRect) convertRect: (CGRect)rect fromWindow: (UIWindow *)window;
- (CGRect) convertRect: (CGRect)rect toWindow: (UIWindow *)window;

// Events...
- (void) sendEvent: (UIEvent *)event;
@end
