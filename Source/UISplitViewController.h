/* Class Header:XIBSplitViewController */
#ifndef __XIBSplitViewController_H_
#define __XIBSplitViewController_H_

#import <Foundation/Foundation.h>


@interface XIBSplitViewController : NSObject
{
  NSString* _ID;
  NSMutableArray* _connections;
  NSString* _sceneMemberID;
  NSMutableArray* _toolbarItems;
}

- (NSString *) ID;
- (NSMutableArray *) connections;
- (NSString *) sceneMemberID;
- (void) setConnections: (NSMutableArray *) connections;
- (void) setID: (NSString *) ID;
- (void) setSceneMemberID: (NSString *) sceneMemberID;
- (void) setToolbarItems: (NSMutableArray *) toolbarItems;
- (NSMutableArray *) toolbarItems;

@end

#endif
