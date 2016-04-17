/* Class Code:XIBAutoresizingMask */

#import "XIBAutoresizingMask.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBAutoresizingMask 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _heightSizable = NO;
      _widthSizable = NO;
   }
   return self;
}

- (BOOL) heightSizable
{
  return _heightSizable;
}

- (void) setHeightSizable: (BOOL) heightSizable
{
  _heightSizable = heightSizable;
}

- (void) setWidthSizable: (BOOL) widthSizable
{
  _widthSizable = widthSizable;
}

- (BOOL) widthSizable
{
  return _widthSizable;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBAutoresizingMask* acopy = [[XIBAutoresizingMask allocWithZone: zone] init];
   [acopy setHeightSizable: [self heightSizable]];
   [acopy setWidthSizable: [self widthSizable]];

   return acopy;
}
@end
