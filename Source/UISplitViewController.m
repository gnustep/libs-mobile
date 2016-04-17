/* Class Code:XIBSplitViewController */

#import "XIBSplitViewController.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBSplitViewController 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _connections = nil;
      _sceneMemberID = nil;
      _toolbarItems = nil;
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

- (void) setToolbarItems: (NSMutableArray *) toolbarItems
{
  ASSIGN(_toolbarItems, toolbarItems);
}

- (NSMutableArray *) toolbarItems
{
  return _toolbarItems;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBSplitViewController* acopy = [[XIBSplitViewController allocWithZone: zone] init];


   [acopy setConnections: [self connections]];
   [acopy setID: [self ID]];
   [acopy setSceneMemberID: [self sceneMemberID]];
   [acopy setToolbarItems: [self toolbarItems]];

   return acopy;
}
@end
