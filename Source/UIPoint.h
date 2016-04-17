/* Class Header:XIBPoint */
#ifndef __XIBPoint_H_
#define __XIBPoint_H_

#import <Foundation/Foundation.h>


@interface XIBPoint : NSObject
{
  NSString* _x;
  NSString* _y;
}

- (void) setX: (NSString *) x;
- (void) setY: (NSString *) y;
- (NSString *) x;
- (NSString *) y;

@end

#endif
