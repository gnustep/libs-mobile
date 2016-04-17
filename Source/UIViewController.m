/* Class Code:XIBViewController */

#import "XIBViewController.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif

#import "XIBNavigationItem.h"
#import "XIBView.h"

@implementation XIBViewController 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _connections = nil;
      _customClass = nil;
      _layoutGuides = nil;
      _navigationItem = nil;
      _sceneMemberID = nil;
      _title = nil;
      _toolbarItems = nil;
      _view = nil;
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

- (NSString *) customClass
{
  return _customClass;
}

- (NSMutableArray *) layoutGuides
{
  return _layoutGuides;
}

- (NSString *) sceneMemberID
{
  return _sceneMemberID;
}

- (void) setConnections: (NSMutableArray *) connections
{
  ASSIGN(_connections, connections);
}

- (void) setCustomClass: (NSString *) customClass
{
  ASSIGN(_customClass, customClass);
}

- (void) setID: (NSString *) ID
{
  ASSIGN(_ID, ID);
}

- (void) setLayoutGuides: (NSMutableArray *) layoutGuides
{
  ASSIGN(_layoutGuides, layoutGuides);
}

- (void) setSceneMemberID: (NSString *) sceneMemberID
{
  ASSIGN(_sceneMemberID, sceneMemberID);
}

- (void) setTitle: (NSString *) title
{
  ASSIGN(_title, title);
}

- (void) setToolbarItems: (NSMutableArray *) toolbarItems
{
  ASSIGN(_toolbarItems, toolbarItems);
}

- (NSString *) title
{
  return _title;
}

- (NSMutableArray *) toolbarItems
{
  return _toolbarItems;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBViewController* acopy = [[XIBViewController allocWithZone: zone] init];




   [acopy setConnections: [self connections]];
   [acopy setCustomClass: [self customClass]];
   [acopy setID: [self ID]];
   [acopy setLayoutGuides: [self layoutGuides]];
   [acopy setSceneMemberID: [self sceneMemberID]];
   [acopy setTitle: [self title]];
   [acopy setToolbarItems: [self toolbarItems]];


   return acopy;
}
@end
