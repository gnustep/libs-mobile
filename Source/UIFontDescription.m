/* Class Code:XIBFontDescription */

#import "XIBFontDescription.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBFontDescription 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _pointSize = nil;
      _size = nil;
      _type = nil;
   }
   return self;
}

- (NSString *) pointSize
{
  return _pointSize;
}

- (void) setPointSize: (NSString *) pointSize
{
  ASSIGN(_pointSize, pointSize);
}

- (void) setSize: (NSString *) size
{
  ASSIGN(_size, size);
}

- (void) setType: (NSString *) type
{
  ASSIGN(_type, type);
}

- (NSString *) size
{
  return _size;
}

- (NSString *) type
{
  return _type;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBFontDescription* acopy = [[XIBFontDescription allocWithZone: zone] init];
   [acopy setPointSize: [self pointSize]];
   [acopy setSize: [self size]];
   [acopy setType: [self type]];


   return acopy;
}
@end
