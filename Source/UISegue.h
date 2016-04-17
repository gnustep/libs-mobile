/* Class Header:XIBSegue */
#ifndef __XIBSegue_H_
#define __XIBSegue_H_

#import <Foundation/Foundation.h>


@interface XIBSegue : NSObject
{
  NSString* _ID;
  NSString* _destination;
  NSString* _identifier;
  NSString* _kind;
  NSString* _reference;
  NSString* _relationship;
}

- (NSString *) ID;
- (NSString *) destination;
- (NSString *) identifier;
- (NSString *) kind;
- (NSString *) reference;
- (NSString *) relationship;
- (void) setDestination: (NSString *) destination;
- (void) setID: (NSString *) ID;
- (void) setIdentifier: (NSString *) identifier;
- (void) setKind: (NSString *) kind;
- (void) setReference: (NSString *) reference;
- (void) setRelationship: (NSString *) relationship;

@end

#endif
