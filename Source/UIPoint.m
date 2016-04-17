/* Class Code:XIBPoint */

#import "XIBPoint.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBPoint 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _x = nil;
      _y = nil;
   }
   return self;
}

- (void) setX: (NSString *) x
{
  ASSIGN(_x, x);
}

- (void) setY: (NSString *) y
{
  ASSIGN(_y, y);
}

- (NSString *) x
{
  return _x;
}

- (NSString *) y
{
  return _y;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBPoint* acopy = [[XIBPoint allocWithZone: zone] init];   [acopy setX: [self x]];
   [acopy setY: [self y]];


   return acopy;
}
@end
