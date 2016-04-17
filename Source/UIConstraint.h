/* Class Header:XIBConstraint */
#ifndef __XIBConstraint_H_
#define __XIBConstraint_H_

#import <Foundation/Foundation.h>


@interface XIBConstraint : NSObject
{
  NSString* _ID;
  NSString* _constant;
  NSString* _firstAttribute;
  NSString* _firstItem;
  NSString* _secondAttribute;
  NSString* _secondItem;
  BOOL _symbolic;
}

- (NSString *) ID;
- (NSString *) constant;
- (NSString *) firstAttribute;
- (NSString *) firstItem;
- (NSString *) secondAttribute;
- (NSString *) secondItem;
- (void) setConstant: (NSString *) constant;
- (void) setFirstAttribute: (NSString *) firstAttribute;
- (void) setFirstItem: (NSString *) firstItem;
- (void) setID: (NSString *) ID;
- (void) setSecondAttribute: (NSString *) secondAttribute;
- (void) setSecondItem: (NSString *) secondItem;
- (void) setSymbolic: (BOOL) symbolic;
- (BOOL) symbolic;

@end

#endif
