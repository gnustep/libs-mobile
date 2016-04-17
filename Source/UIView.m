/* Class Code:XIBView */

#import "XIBView.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif

#import "XIBAutoresizingMask.h"
#import "XIBColor.h"
#import "XIBRect.h"

@implementation XIBView 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _autoresizingMask = nil;
      _backgroundColor = nil;
      _constraints = nil;
      _contentMode = nil;
      _frame = nil;
      _subviews = nil;
   }
   return self;
}

- (NSString *) ID
{
  return _ID;
}

- (NSMutableArray *) constraints
{
  return _constraints;
}

- (NSString *) contentMode
{
  return _contentMode;
}

- (void) setConstraints: (NSMutableArray *) constraints
{
  ASSIGN(_constraints, constraints);
}

- (void) setContentMode: (NSString *) contentMode
{
  ASSIGN(_contentMode, contentMode);
}

- (void) setID: (NSString *) ID
{
  ASSIGN(_ID, ID);
}

- (void) setSubviews: (NSMutableArray *) subviews
{
  ASSIGN(_subviews, subviews);
}

- (NSMutableArray *) subviews
{
  return _subviews;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBView* acopy = [[XIBView allocWithZone: zone] init];


   [acopy setConstraints: [self constraints]];
   [acopy setContentMode: [self contentMode]];
   [acopy setID: [self ID]];
   [acopy setSubviews: [self subviews]];

   return acopy;
}
@end
