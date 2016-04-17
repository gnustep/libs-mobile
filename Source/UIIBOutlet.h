/* Class Header:XIBIBOutlet */
#ifndef __XIBIBOutlet_H_
#define __XIBIBOutlet_H_

#import <Foundation/Foundation.h>


@interface XIBIBOutlet : NSObject
{
  NSString* _ID;
  NSString* _destination;
  NSString* _property;
}

- (NSString *) ID;
- (NSString *) destination;
- (NSString *) property;
- (void) setDestination: (NSString *) destination;
- (void) setID: (NSString *) ID;
- (void) setProperty: (NSString *) property;

@end

#endif
