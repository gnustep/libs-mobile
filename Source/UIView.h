/* Class Header:XIBView */
#ifndef __XIBView_H_
#define __XIBView_H_

#import <Foundation/Foundation.h>

@class XIBAutoresizingMask;
@class XIBColor;
@class XIBRect;

@interface XIBView : NSObject
{
  NSString* _ID;
  XIBAutoresizingMask* _autoresizingMask;
  XIBColor* _backgroundColor;
  NSMutableArray* _constraints;
  NSString* _contentMode;
  XIBRect* _frame;
  NSMutableArray* _subviews;
}

- (NSString *) ID;
- (NSMutableArray *) constraints;
- (NSString *) contentMode;
- (void) setConstraints: (NSMutableArray *) constraints;
- (void) setContentMode: (NSString *) contentMode;
- (void) setID: (NSString *) ID;
- (void) setSubviews: (NSMutableArray *) subviews;
- (NSMutableArray *) subviews;

@end

#endif
