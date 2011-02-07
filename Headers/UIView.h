/** <title>UIView</title>

   <abstract>The view class</abstract>

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
#import "UIKit/UIResponder.h"

@class UIEvent, UIGestureRecognizer, UIViewPrintFormatter, UIWindow;

enum {
  UIViewAnimationOptionLayoutSubviews            = 1 << 0,
  UIViewAnimationOptionAllowUserInteraction      = 1 << 1,
  UIViewAnimationOptionBeginFromCurrentState     = 1 << 2,
  UIViewAnimationOptionRepeat                    = 1 << 3,
  UIViewAnimationOptionAutoreverse               = 1 << 4,
  UIViewAnimationOptionOverrideInheritedDuration = 1 << 5,
  UIViewAnimationOptionOverrideInheritedCurve    = 1 << 6,
  UIViewAnimationOptionAllowAnimatedContent      = 1 << 7,
  UIViewAnimationOptionShowHideTransitionViews   = 1 << 8,
  
  UIViewAnimationOptionCurveEaseInOut            = 0 << 16,
  UIViewAnimationOptionCurveEaseIn               = 1 << 16,
  UIViewAnimationOptionCurveEaseOut              = 2 << 16,
  UIViewAnimationOptionCurveLinear               = 3 << 16,
  
  UIViewAnimationOptionTransitionNone            = 0 << 20,
  UIViewAnimationOptionTransitionFlipFromLeft    = 1 << 20,
  UIViewAnimationOptionTransitionFlipFromRight   = 2 << 20,
  UIViewAnimationOptionTransitionCurlUp          = 3 << 20,
  UIViewAnimationOptionTransitionCurlDown        = 4 << 20,
};
typedef NSUInteger UIViewAnimationOptions;

typedef enum {
  UIViewAnimationCurveEaseInOut,
  UIViewAnimationCurveEaseIn,
  UIViewAnimationCurveEaseOut,
  UIViewAnimationCurveLinear
} UIViewAnimationCurve;

typedef enum {
  UIViewContentModeScaleToFill,
  UIViewContentModeScaleAspectFit,
  UIViewContentModeScaleAspectFill,
  UIViewContentModeRedraw,
  UIViewContentModeCenter,
  UIViewContentModeTop,
  UIViewContentModeBottom,
  UIViewContentModeLeft,
  UIViewContentModeRight,
  UIViewContentModeTopLeft,
  UIViewContentModeTopRight,
  UIViewContentModeBottomLeft,
  UIViewContentModeBottomRight,
} UIViewContentMode;

enum {
  UIViewAutoresizingNone                 = 0,
  UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
  UIViewAutoresizingFlexibleWidth        = 1 << 1,
  UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
  UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
  UIViewAutoresizingFlexibleHeight       = 1 << 4,
  UIViewAutoresizingFlexibleBottomMargin = 1 << 5
};
typedef NSUInteger UIViewAutoresizing;

typedef enum {
  UIViewAnimationTransitionNone,
  UIViewAnimationTransitionFlipFromLeft,
  UIViewAnimationTransitionFlipFromRight,
  UIViewAnimationTransitionCurlUp,
  UIViewAnimationTransitionCurlDown,
} UIViewAnimationTransition;


@interface UIView : UIResponder <NSCoder>
{
}

//@property(nonatomic) CGFloat alpha;
//@property(nonatomic) BOOL autoresizesSubviews;
//@property(nonatomic) UIViewAutoresizing autoresizingMask;
//@property(nonatomic, copy) UIColor *backgroundColor;
//@pperty(nonatomic) CGRect bounds;
//@property(nonatomic) CGPoint center;
//@property(nonatomic) BOOL clearsContextBeforeDrawing;
//@property(nonatomic) BOOL clipsToBounds;
//@property(nonatomic) UIViewContentMode contentMode;
//@property(nonatomic) CGFloat contentScaleFactor;
//@property(nonatomic) CGRect contentStretch;
//@property(nonatomic, getter=isExclusiveTouch) BOOL exclusiveTouch;
//@property(nonatomic) CGRect frame;
//@property(nonatomic,copy) NSArray *gestureRecognizers;
//@property(nonatomic, getter=isHidden) BOOL hidden;
//@property(nonatomic, readonly, retain) CALayer *layer;
//@property(nonatomic, getter=isMultipleTouchEnabled) BOOL multipleTouchEnabled;
//@property(nonatomic, getter=isOpaque) BOOL opaque;
//@property(nonatomic, readonly, copy) NSArray *subviews;
//@property(nonatomic, readonly) UIView *superview;
//@property(nonatomic) NSInteger tag;
//@property(nonatomic) CGAffineTransform transform;
//@property(nonatomic, getter=isUserInteractionEnabled) BOOL userInteractionEnabled;
//@property(nonatomic, readonly) UIWindow *window;

//+ (void)animateWithDuration: (NSTimeInterval)duration animations: (void (^)(void))animations;
//+ (void)animateWithDuration: (NSTimeInterval)duration animations: (void (^)(void))animations completion: (void (^)(BOOL finished))completion;
//+ (void) animateWithDuration: (NSTimeInterval)duration delay: (NSTimeInterval)delay options: (UIViewAnimationOptions)options animations: (void (^)(void))animations completion: (void (^)(BOOL finished))completion;

+ (BOOL) areAnimationsEnabled;
+ (void) beginAnimations: (NSString *)animationID context: (void *)context;
+ (void) commitAnimations;
+ (Class) layerClass;
+ (void) setAnimationBeginsFromCurrentState: (BOOL)fromCurrentState;
+ (void) setAnimationCurve: (UIViewAnimationCurve)curve;
+ (void) setAnimationDelay: (NSTimeInterval)delay;
+ (void) setAnimationDelegate: (id)delegate;
+ (void) setAnimationDidStopSelector: (SEL)selector;
+ (void) setAnimationDuration: (NSTimeInterval)duration;
+ (void) setAnimationRepeatAutoreverses: (BOOL)repeatAutoreverses;
+ (void) setAnimationRepeatCount: (float)repeatCount;
+ (void) setAnimationsEnabled: (BOOL)enabled;
+ (void) setAnimationStartDate: (NSDate *)startTime;
+ (void) setAnimationTransition: (UIViewAnimationTransition)transition 
                        forView: (UIView *)view 
                          cache: (BOOL)cache;
+ (void) setAnimationWillStartSelector: (SEL)selector;
//+ (void) transitionFromView: (UIView *)fromView toView: (UIView *)toView duration: (NSTimeInterval)duration options: (UIViewAnimationOptions)options completion: (void (^)(BOOL finished))completion;
//+ (void) transitionWithView: (UIView *)view duration: (NSTimeInterval)duration options: (UIViewAnimationOptions)options animations: (void (^)(void))animations completion: (void (^)(BOOL finished))completion;

- (void) addGestureRecognizer: (UIGestureRecognizer *)gestureRecognizer;
- (void) addSubview: (UIView *)view;
- (void) bringSubviewToFront: (UIView *)view;
- (CGPoint) convertPoint: (CGPoint)point fromView: (UIView *)view;
- (CGPoint) convertPoint: (CGPoint)point toView: (UIView *)view;
- (CGRect) convertRect: (CGRect)rect fromView: (UIView *)view;
- (CGRect) convertRect: (CGRect)rect toView: (UIView *)view;
- (void) didAddSubview: (UIView *)subview;
- (void) didMoveToSuperview;
- (void) didMoveToWindow;
- (void) drawRect: (CGRect)rect;
- (void) drawRect: (CGRect)area forViewPrintFormatter: (UIViewPrintFormatter *)formatter
- (BOOL) endEditing: (BOOL)force;
- (void) exchangeSubviewAtIndex: (NSInteger)index1 withSubviewAtIndex: (NSInteger)index2;
- (UIView *) hitTest: (CGPoint)point withEvent: (UIEvent *)event;
- (id) initWithFrame: (CGRect)aRect;
- (void) insertSubview: (UIView *)view aboveSubview: (UIView *)siblingSubview;
- (void) insertSubview: (UIView *)view atIndex: (NSInteger)index;
- (void) insertSubview: (UIView *)view belowSubview: (UIView *)siblingSubview;
- (BOOL) isDescendantOfView: (UIView *)view;
- (void) layoutIfNeeded;
- (void) layoutSubviews;
- (BOOL) pointInside: (CGPoint)point withEvent: (UIEvent *)event;
- (void) removeFromSuperview;
- (void) removeGestureRecognizer: (UIGestureRecognizer *)gestureRecognizer;
- (void) sendSubviewToBack: (UIView *)view;
- (void) setNeedsDisplay;
- (void) setNeedsDisplayInRect: (CGRect)invalidRect;
- (void) setNeedsLayout;
- (CGSize) sizeThatFits: (CGSize)size;
- (void) sizeToFit;
- (UIViewPrintFormatter *) viewPrintFormatter;
- (UIView *) viewWithTag: (NSInteger)tag;
- (void) willMoveToSuperview: (UIView *)newSuperview;
- (void) willMoveToWindow: (UIWindow *)newWindow;
- (void) willRemoveSubview: (UIView *)subview;

@end
