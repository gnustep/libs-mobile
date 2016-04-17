/* Class Code:XIBIBDeployment */

#import "XIBIBDeployment.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBIBDeployment 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _identifier = nil;
   }
   return self;
}

- (NSString *) identifier
{
  return _identifier;
}

- (void) setIdentifier: (NSString *) identifier
{
  ASSIGN(_identifier, identifier);
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBIBDeployment* acopy = [[XIBIBDeployment allocWithZone: zone] init];
   [acopy setIdentifier: [self identifier]];
   return acopy;
}
@end
