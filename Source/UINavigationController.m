/* Class Code:XIBNavigationController */

#import "XIBNavigationController.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif

#import "XIBNavigationBar.h"

@implementation XIBNavigationController 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _connections = nil;
      _navigationBar = nil;
      _sceneMemberID = nil;
      _title = nil;
   }
   return self;
}

- (NSString *) ID
{
  return _ID;
}

- (NSMutableArray *) connections
{
  return _connections;
}

- (NSString *) sceneMemberID
{
  return _sceneMemberID;
}

- (void) setConnections: (NSMutableArray *) connections
{
  ASSIGN(_connections, connections);
}

- (void) setID: (NSString *) ID
{
  ASSIGN(_ID, ID);
}

- (void) setSceneMemberID: (NSString *) sceneMemberID
{
  ASSIGN(_sceneMemberID, sceneMemberID);
}

- (void) setTitle: (NSString *) title
{
  ASSIGN(_title, title);
}

- (NSString *) title
{
  return _title;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBNavigationController* acopy = [[XIBNavigationController allocWithZone: zone] init];


   [acopy setConnections: [self connections]];
   [acopy setID: [self ID]];
   [acopy setSceneMemberID: [self sceneMemberID]];
   [acopy setTitle: [self title]];

   return acopy;
}
@end
