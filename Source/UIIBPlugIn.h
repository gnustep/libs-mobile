/* Class Header:XIBIBPlugIn */
#ifndef __XIBIBPlugIn_H_
#define __XIBIBPlugIn_H_

#import <Foundation/Foundation.h>


@interface XIBIBPlugIn : NSObject
{
  NSString* _identifier;
  NSString* _version;
}

- (NSString *) identifier;
- (void) setIdentifier: (NSString *) identifier;
- (void) setVersion: (NSString *) version;
- (NSString *) version;

@end

#endif
