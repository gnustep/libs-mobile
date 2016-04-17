/* Class Code:XIBIBPlugIn */

#import "XIBIBPlugIn.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBIBPlugIn 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _identifier = nil;
      _version = nil;
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

- (void) setVersion: (NSString *) version
{
  ASSIGN(_version, version);
}

- (NSString *) version
{
  return _version;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBIBPlugIn* acopy = [[XIBIBPlugIn allocWithZone: zone] init];
   [acopy setIdentifier: [self identifier]];
   [acopy setVersion: [self version]];

   return acopy;
}
@end
