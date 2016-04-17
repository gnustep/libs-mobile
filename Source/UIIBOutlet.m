/* Class Code:XIBIBOutlet */

#import "XIBIBOutlet.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBIBOutlet 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _destination = nil;
      _property = nil;
   }
   return self;
}

- (NSString *) ID
{
  return _ID;
}

- (NSString *) destination
{
  return _destination;
}

- (NSString *) property
{
  return _property;
}

- (void) setDestination: (NSString *) destination
{
  ASSIGN(_destination, destination);
}

- (void) setID: (NSString *) ID
{
  ASSIGN(_ID, ID);
}

- (void) setProperty: (NSString *) property
{
  ASSIGN(_property, property);
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBIBOutlet* acopy = [[XIBIBOutlet allocWithZone: zone] init];


   [acopy setDestination: [self destination]];
   [acopy setID: [self ID]];
   [acopy setProperty: [self property]];
   return acopy;
}
@end
