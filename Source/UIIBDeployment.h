/* Class Header:XIBIBDeployment */
#ifndef __XIBIBDeployment_H_
#define __XIBIBDeployment_H_

#import <Foundation/Foundation.h>


@interface XIBIBDeployment : NSObject
{
  NSString* _identifier;
}

- (NSString *) identifier;
- (void) setIdentifier: (NSString *) identifier;

@end

#endif
