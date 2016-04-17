/* Class Header:XIBPlaceholder */
#ifndef __XIBPlaceholder_H_
#define __XIBPlaceholder_H_

#import <Foundation/Foundation.h>


@interface XIBPlaceholder : NSObject
{
  NSString* _ID;
  NSString* _placeholderIdentifier;
  NSString* _sceneMemberID;
  NSString* _userLabel;
}

- (NSString *) ID;
- (NSString *) placeholderIdentifier;
- (NSString *) sceneMemberID;
- (void) setID: (NSString *) ID;
- (void) setPlaceholderIdentifier: (NSString *) placeholderIdentifier;
- (void) setSceneMemberID: (NSString *) sceneMemberID;
- (void) setUserLabel: (NSString *) userLabel;
- (NSString *) userLabel;

@end

#endif
