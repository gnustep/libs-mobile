/* Class Code:XIBTableViewController */

#import "XIBTableViewController.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif

#import "XIBNavigationItem.h"
#import "XIBTableView.h"

@implementation XIBTableViewController 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _clearsSelectionOnViewWillAppear = NO;
      _customClass = nil;
      _navigationItem = nil;
      _sceneMemberID = nil;
      _title = nil;
      _view = nil;
   }
   return self;
}

- (NSString *) ID
{
  return _ID;
}

- (BOOL) clearsSelectionOnViewWillAppear
{
  return _clearsSelectionOnViewWillAppear;
}

- (NSString *) customClass
{
  return _customClass;
}

- (NSString *) sceneMemberID
{
  return _sceneMemberID;
}

- (void) setClearsSelectionOnViewWillAppear: (BOOL) clearsSelectionOnViewWillAppear
{
  _clearsSelectionOnViewWillAppear = clearsSelectionOnViewWillAppear;
}

- (void) setCustomClass: (NSString *) customClass
{
  ASSIGN(_customClass, customClass);
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
   XIBTableViewController* acopy = [[XIBTableViewController allocWithZone: zone] init];



   [acopy setClearsSelectionOnViewWillAppear: [self clearsSelectionOnViewWillAppear]];
   [acopy setCustomClass: [self customClass]];
   [acopy setID: [self ID]];
   [acopy setSceneMemberID: [self sceneMemberID]];
   [acopy setTitle: [self title]];

   return acopy;
}
@end
