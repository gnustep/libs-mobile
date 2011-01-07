/** <title>UIWindow</title>

   <abstract>The window class</abstract>

   Copyright (C) 2011 Free Software Foundation, Inc.

   Author: Gregory Casamento
   Date: January 2011

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
#import <AppKit/AppKit.h>

@class UIViewController, UIScreen, UIEvent;

typedef CGFloat UIWindowLevel;
const UIWindowLevel UIWindowLevelNormal = 0;
const UIWindowLevel UIWindowLevelAlert = 1;
const UIWindowLevel UIWindowLevelStatusBar = 2;

@interface UIWindow : NSWindow
{
  UIViewController *rootViewController;
}

/*
 * Properties...
 */
- (BOOL) keyWindow;
- (void) setRootViewController: (UIViewController *)aViewController;
- (UIViewController *) rootViewController;
- (UIScreen *) screen;
- (UIWindowLevel) windowLevel;

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
