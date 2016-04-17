/* Class Code:XIBSegue */

#import "XIBSegue.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBSegue 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _destination = nil;
      _identifier = nil;
      _kind = nil;
      _reference = nil;
      _relationship = nil;
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

- (NSString *) identifier
{
  return _identifier;
}

- (NSString *) kind
{
  return _kind;
}

- (NSString *) reference
{
  return _reference;
}

- (NSString *) relationship
{
  return _relationship;
}

- (void) setDestination: (NSString *) destination
{
  ASSIGN(_destination, destination);
}

- (void) setID: (NSString *) ID
{
  ASSIGN(_ID, ID);
}

- (void) setIdentifier: (NSString *) identifier
{
  ASSIGN(_identifier, identifier);
}

- (void) setKind: (NSString *) kind
{
  ASSIGN(_kind, kind);
}

- (void) setReference: (NSString *) reference
{
  ASSIGN(_reference, reference);
}

- (void) setRelationship: (NSString *) relationship
{
  ASSIGN(_relationship, relationship);
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBSegue* acopy = [[XIBSegue allocWithZone: zone] init];





   [acopy setDestination: [self destination]];
   [acopy setID: [self ID]];
   [acopy setIdentifier: [self identifier]];
   [acopy setKind: [self kind]];
   [acopy setReference: [self reference]];
   [acopy setRelationship: [self relationship]];
   return acopy;
}
@end
