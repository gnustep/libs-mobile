/* Class Code:XIBNil */

#import "XIBNil.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBNil 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
   }
   return self;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBNil* acopy = [[XIBNil allocWithZone: zone] init];   return acopy;
}
@end
