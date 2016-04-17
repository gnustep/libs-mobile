/* Class Code:XIBPlaceholder */

#import "XIBPlaceholder.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBPlaceholder 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _placeholderIdentifier = nil;
      _sceneMemberID = nil;
      _userLabel = nil;
   }
   return self;
}

- (NSString *) ID
{
  return _ID;
}

- (NSString *) placeholderIdentifier
{
  return _placeholderIdentifier;
}

- (NSString *) sceneMemberID
{
  return _sceneMemberID;
}

- (void) setID: (NSString *) ID
{
  ASSIGN(_ID, ID);
}

- (void) setPlaceholderIdentifier: (NSString *) placeholderIdentifier
{
  ASSIGN(_placeholderIdentifier, placeholderIdentifier);
}

- (void) setSceneMemberID: (NSString *) sceneMemberID
{
  ASSIGN(_sceneMemberID, sceneMemberID);
}

- (void) setUserLabel: (NSString *) userLabel
{
  ASSIGN(_userLabel, userLabel);
}

- (NSString *) userLabel
{
  return _userLabel;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBPlaceholder* acopy = [[XIBPlaceholder allocWithZone: zone] init];


   [acopy setID: [self ID]];
   [acopy setPlaceholderIdentifier: [self placeholderIdentifier]];
   [acopy setSceneMemberID: [self sceneMemberID]];
   [acopy setUserLabel: [self userLabel]];

   return acopy;
}
@end
