/* Class Header:XIBNavigationController */
#ifndef __XIBNavigationController_H_
#define __XIBNavigationController_H_

#import <Foundation/Foundation.h>

@class XIBNavigationBar;

@interface XIBNavigationController : NSObject
{
  NSString* _ID;
  NSMutableArray* _connections;
  XIBNavigationBar* _navigationBar;
  NSString* _sceneMemberID;
  NSString* _title;
}

- (NSString *) ID;
- (NSMutableArray *) connections;
- (NSString *) sceneMemberID;
- (void) setConnections: (NSMutableArray *) connections;
- (void) setID: (NSString *) ID;
- (void) setSceneMemberID: (NSString *) sceneMemberID;
- (void) setTitle: (NSString *) title;
- (NSString *) title;

@end

#endif
