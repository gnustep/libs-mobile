/** <title>UIResponder</title>

   <abstract>The responder class</abstract>

   Copyright (C) 2011 Free Software Foundation, Inc.

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
#import "UIKit/UIEvent.h"

@class UIView;

@interface UIResponder : NSObject
{
}

//@property (readonly, retain) UIView *inputAccessoryView;
- (UIView *) inputAccessoryView;
//@property (readonly, retain) UIView *inputView;
- (UIView *) inputView;
//@property (readonly) NSUndoManager *undoManager;
- (NSUndoManager *) undoManager;

- (BOOL) becomeFirstResponder;
- (BOOL) canBecomeFirstResponder;
- (BOOL) canPerformAction: (SEL)action withSender: (id)sender;
- (BOOL) canResignFirstResponder;
- (BOOL) isFirstResponder;
- (void) motionBegan: (UIEventSubtype)motion withEvent: (UIEvent *)event;
- (void) motionCancelled: (UIEventSubtype)motion withEvent: (UIEvent *)event;
- (void) motionEnded: (UIEventSubtype)motion withEvent: (UIEvent *)event;
- (UIResponder *) nextResponder;
- (void) reloadInputViews;
- (void) remoteControlReceivedWithEvent: (UIEvent *)event;
- (BOOL) resignFirstResponder;
- (void) touchesBegan: (NSSet *)touches withEvent: (UIEvent *)event;
- (void) touchesCancelled: (NSSet *)touches withEvent: (UIEvent *)event;
- (void) touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event;
- (void) touchesMoved: (NSSet *)touches withEvent: (UIEvent *)event;

@end
