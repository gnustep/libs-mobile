/* Class Code:XIBRect */

#import "XIBRect.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBRect 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _height = nil;
      _width = nil;
      _x = nil;
      _y = nil;
   }
   return self;
}

- (NSString *) height
{
  return _height;
}

- (void) setHeight: (NSString *) height
{
  ASSIGN(_height, height);
}

- (void) setWidth: (NSString *) width
{
  ASSIGN(_width, width);
}

- (void) setX: (NSString *) x
{
  ASSIGN(_x, x);
}

- (void) setY: (NSString *) y
{
  ASSIGN(_y, y);
}

- (NSString *) width
{
  return _width;
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
   XIBRect* acopy = [[XIBRect allocWithZone: zone] init];
   [acopy setHeight: [self height]];
   [acopy setWidth: [self width]];
   [acopy setX: [self x]];
   [acopy setY: [self y]];



   return acopy;
}
@end
