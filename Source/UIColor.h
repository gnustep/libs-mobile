/* Class Header:XIBColor */
#ifndef __XIBColor_H_
#define __XIBColor_H_

#import <Foundation/Foundation.h>


@interface XIBColor : NSObject
{
  NSString* _alpha;
  NSString* _blue;
  NSString* _cocoaTouchSystemColor;
  NSString* _colorSpace;
  NSString* _customColorSpace;
  NSString* _green;
  NSString* _red;
  NSString* _white;
}

- (NSString *) alpha;
- (NSString *) blue;
- (NSString *) cocoaTouchSystemColor;
- (NSString *) colorSpace;
- (NSString *) customColorSpace;
- (NSString *) green;
- (NSString *) red;
- (void) setAlpha: (NSString *) alpha;
- (void) setBlue: (NSString *) blue;
- (void) setCocoaTouchSystemColor: (NSString *) cocoaTouchSystemColor;
- (void) setColorSpace: (NSString *) colorSpace;
- (void) setCustomColorSpace: (NSString *) customColorSpace;
- (void) setGreen: (NSString *) green;
- (void) setRed: (NSString *) red;
- (void) setWhite: (NSString *) white;
- (NSString *) white;

@end

#endif
