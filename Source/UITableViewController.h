/* Class Header:XIBTableViewController */
#ifndef __XIBTableViewController_H_
#define __XIBTableViewController_H_

#import <Foundation/Foundation.h>

@class XIBNavigationItem;
@class XIBTableView;

@interface XIBTableViewController : NSObject
{
  NSString* _ID;
  BOOL _clearsSelectionOnViewWillAppear;
  NSString* _customClass;
  XIBNavigationItem* _navigationItem;
  NSString* _sceneMemberID;
  NSString* _title;
  XIBTableView* _view;
}

- (NSString *) ID;
- (BOOL) clearsSelectionOnViewWillAppear;
- (NSString *) customClass;
- (NSString *) sceneMemberID;
- (void) setClearsSelectionOnViewWillAppear: (BOOL) clearsSelectionOnViewWillAppear;
- (void) setCustomClass: (NSString *) customClass;
- (void) setID: (NSString *) ID;
- (void) setSceneMemberID: (NSString *) sceneMemberID;
- (void) setTitle: (NSString *) title;
- (NSString *) title;

@end

#endif
