/** <title>UIEvent</title>

   <abstract>The event class</abstract>

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

@class UIGestureRecognizer, UIView, UIWindow;

typedef enum {
  UIEventTypeTouches,
  UIEventTypeMotion,
  UIEventTypeRemoteControl,
} UIEventType;

typedef enum {
  UIEventSubtypeNone                              = 0,
  
  UIEventSubtypeMotionShake                       = 1,
  
  UIEventSubtypeRemoteControlPlay                 = 100,
  UIEventSubtypeRemoteControlPause                = 101,
  UIEventSubtypeRemoteControlStop                 = 102,
  UIEventSubtypeRemoteControlTogglePlayPause      = 103,
  UIEventSubtypeRemoteControlNextTrack            = 104,
  UIEventSubtypeRemoteControlPreviousTrack        = 105,
  UIEventSubtypeRemoteControlBeginSeekingBackward = 106,
  UIEventSubtypeRemoteControlEndSeekingBackward   = 107,
  UIEventSubtypeRemoteControlBeginSeekingForward  = 108,
  UIEventSubtypeRemoteControlEndSeekingForward    = 109,
} UIEventSubtype;

@interface UIEvent : NSObject
{
}

/*
 * Properties...
 */
//@property(readonly) UIEventSubtype subtype;
//@property(nonatomic, readonly) NSTimeInterval timestamp;
//@property(readonly) UIEventType type;


/*
 * Methods
 */
- (NSSet *) allTouches;
- (NSSet *) touchesForGestureRecognizer: (UIGestureRecognizer *)gesture;
- (NSSet *) touchesForView: (UIView *)view;
- (NSSet *) touchesForWindow: (UIWindow *)window;

@end
