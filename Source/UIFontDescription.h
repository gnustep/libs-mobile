/* Class Header:XIBFontDescription */
#ifndef __XIBFontDescription_H_
#define __XIBFontDescription_H_

#import <Foundation/Foundation.h>


@interface XIBFontDescription : NSObject
{
  NSString* _pointSize;
  NSString* _size;
  NSString* _type;
}

- (NSString *) pointSize;
- (void) setPointSize: (NSString *) pointSize;
- (void) setSize: (NSString *) size;
- (void) setType: (NSString *) type;
- (NSString *) size;
- (NSString *) type;

@end

#endif
