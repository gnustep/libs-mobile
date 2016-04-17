/* Class Code:XIBViewControllerLayoutGuide */

#import "XIBViewControllerLayoutGuide.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBViewControllerLayoutGuide 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _type = nil;
   }
   return self;
}

- (NSString *) ID
{
  return _ID;
}

- (void) setID: (NSString *) ID
{
  ASSIGN(_ID, ID);
}

- (void) setType: (NSString *) type
{
  ASSIGN(_type, type);
}

- (NSString *) type
{
  return _type;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBViewControllerLayoutGuide* acopy = [[XIBViewControllerLayoutGuide allocWithZone: zone] init];
   [acopy setID: [self ID]];
   [acopy setType: [self type]];

   return acopy;
}
@end
