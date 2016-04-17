/* Class Code:XIBConstraint */

#import "XIBConstraint.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBConstraint 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _constant = nil;
      _firstAttribute = nil;
      _firstItem = nil;
      _secondAttribute = nil;
      _secondItem = nil;
      _symbolic = NO;
   }
   return self;
}

- (NSString *) ID
{
  return _ID;
}

- (NSString *) constant
{
  return _constant;
}

- (NSString *) firstAttribute
{
  return _firstAttribute;
}

- (NSString *) firstItem
{
  return _firstItem;
}

- (NSString *) secondAttribute
{
  return _secondAttribute;
}

- (NSString *) secondItem
{
  return _secondItem;
}

- (void) setConstant: (NSString *) constant
{
  ASSIGN(_constant, constant);
}

- (void) setFirstAttribute: (NSString *) firstAttribute
{
  ASSIGN(_firstAttribute, firstAttribute);
}

- (void) setFirstItem: (NSString *) firstItem
{
  ASSIGN(_firstItem, firstItem);
}

- (void) setID: (NSString *) ID
{
  ASSIGN(_ID, ID);
}

- (void) setSecondAttribute: (NSString *) secondAttribute
{
  ASSIGN(_secondAttribute, secondAttribute);
}

- (void) setSecondItem: (NSString *) secondItem
{
  ASSIGN(_secondItem, secondItem);
}

- (void) setSymbolic: (BOOL) symbolic
{
  _symbolic = symbolic;
}

- (BOOL) symbolic
{
  return _symbolic;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBConstraint* acopy = [[XIBConstraint allocWithZone: zone] init];





   [acopy setConstant: [self constant]];
   [acopy setFirstAttribute: [self firstAttribute]];
   [acopy setFirstItem: [self firstItem]];
   [acopy setID: [self ID]];
   [acopy setSecondAttribute: [self secondAttribute]];
   [acopy setSecondItem: [self secondItem]];
   [acopy setSymbolic: [self symbolic]];

   return acopy;
}
@end
