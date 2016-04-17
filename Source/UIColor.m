/* Class Code:XIBColor */

#import "XIBColor.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBColor 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _alpha = nil;
      _blue = nil;
      _cocoaTouchSystemColor = nil;
      _colorSpace = nil;
      _customColorSpace = nil;
      _green = nil;
      _red = nil;
      _white = nil;
   }
   return self;
}

- (NSString *) alpha
{
  return _alpha;
}

- (NSString *) blue
{
  return _blue;
}

- (NSString *) cocoaTouchSystemColor
{
  return _cocoaTouchSystemColor;
}

- (NSString *) colorSpace
{
  return _colorSpace;
}

- (NSString *) customColorSpace
{
  return _customColorSpace;
}

- (NSString *) green
{
  return _green;
}

- (NSString *) red
{
  return _red;
}

- (void) setAlpha: (NSString *) alpha
{
  ASSIGN(_alpha, alpha);
}

- (void) setBlue: (NSString *) blue
{
  ASSIGN(_blue, blue);
}

- (void) setCocoaTouchSystemColor: (NSString *) cocoaTouchSystemColor
{
  ASSIGN(_cocoaTouchSystemColor, cocoaTouchSystemColor);
}

- (void) setColorSpace: (NSString *) colorSpace
{
  ASSIGN(_colorSpace, colorSpace);
}

- (void) setCustomColorSpace: (NSString *) customColorSpace
{
  ASSIGN(_customColorSpace, customColorSpace);
}

- (void) setGreen: (NSString *) green
{
  ASSIGN(_green, green);
}

- (void) setRed: (NSString *) red
{
  ASSIGN(_red, red);
}

- (void) setWhite: (NSString *) white
{
  ASSIGN(_white, white);
}

- (NSString *) white
{
  return _white;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBColor* acopy = [[XIBColor allocWithZone: zone] init];






   [acopy setAlpha: [self alpha]];
   [acopy setBlue: [self blue]];
   [acopy setCocoaTouchSystemColor: [self cocoaTouchSystemColor]];
   [acopy setColorSpace: [self colorSpace]];
   [acopy setCustomColorSpace: [self customColorSpace]];
   [acopy setGreen: [self green]];
   [acopy setRed: [self red]];
   [acopy setWhite: [self white]];

   return acopy;
}
@end
