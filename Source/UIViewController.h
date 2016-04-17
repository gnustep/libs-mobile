/* Class Header:XIBViewController */
#ifndef __XIBViewController_H_
#define __XIBViewController_H_

#import <Foundation/Foundation.h>

@class XIBNavigationItem;
@class XIBView;

@interface XIBViewController : NSObject
{
  NSString* _ID;
  NSMutableArray* _connections;
  NSString* _customClass;
  NSMutableArray* _layoutGuides;
  XIBNavigationItem* _navigationItem;
  NSString* _sceneMemberID;
  NSString* _title;
  NSMutableArray* _toolbarItems;
  XIBView* _view;
}

- (NSString *) ID;
- (NSMutableArray *) connections;
- (NSString *) customClass;
- (NSMutableArray *) layoutGuides;
- (NSString *) sceneMemberID;
- (void) setConnections: (NSMutableArray *) connections;
- (void) setCustomClass: (NSString *) customClass;
- (void) setID: (NSString *) ID;
- (void) setLayoutGuides: (NSMutableArray *) layoutGuides;
- (void) setSceneMemberID: (NSString *) sceneMemberID;
- (void) setTitle: (NSString *) title;
- (void) setToolbarItems: (NSMutableArray *) toolbarItems;
- (NSString *) title;
- (NSMutableArray *) toolbarItems;

@end

#endif
