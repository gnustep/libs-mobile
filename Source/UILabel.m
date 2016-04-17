/* Class Code:XIBLabel */

#import "XIBLabel.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif

#import "XIBAutoresizingMask.h"
#import "XIBColor.h"
#import "XIBFontDescription.h"
#import "XIBRect.h"
#import "XIBNil.h"
#import "XIBColor.h"

@implementation XIBLabel 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _adjustsFontSizeToFit = NO;
      _autoresizingMask = nil;
      _backgroundColor = nil;
      _baselineAdjustment = nil;
      _clipsSubviews = NO;
      _contentMode = nil;
      _fontDescription = nil;
      _frame = nil;
      _highlightedColor = nil;
      _lineBreakMode = nil;
      _minimumFontSize = nil;
      _multipleTouchEnabled = NO;
      _opaque = NO;
      _text = nil;
      _textAlignment = nil;
      _textColor = nil;
      _translatesAutoresizingMaskIntoConstraints = NO;
      _userInteractionEnabled = NO;
   }
   return self;
}

- (NSString *) ID
{
  return _ID;
}

- (BOOL) adjustsFontSizeToFit
{
  return _adjustsFontSizeToFit;
}

- (NSString *) baselineAdjustment
{
  return _baselineAdjustment;
}

- (BOOL) clipsSubviews
{
  return _clipsSubviews;
}

- (NSString *) contentMode
{
  return _contentMode;
}

- (NSString *) lineBreakMode
{
  return _lineBreakMode;
}

- (NSString *) minimumFontSize
{
  return _minimumFontSize;
}

- (BOOL) multipleTouchEnabled
{
  return _multipleTouchEnabled;
}

- (BOOL) opaque
{
  return _opaque;
}

- (void) setAdjustsFontSizeToFit: (BOOL) adjustsFontSizeToFit
{
  _adjustsFontSizeToFit = adjustsFontSizeToFit;
}

- (void) setBaselineAdjustment: (NSString *) baselineAdjustment
{
  ASSIGN(_baselineAdjustment, baselineAdjustment);
}

- (void) setClipsSubviews: (BOOL) clipsSubviews
{
  _clipsSubviews = clipsSubviews;
}

- (void) setContentMode: (NSString *) contentMode
{
  ASSIGN(_contentMode, contentMode);
}

- (void) setID: (NSString *) ID
{
  ASSIGN(_ID, ID);
}

- (void) setLineBreakMode: (NSString *) lineBreakMode
{
  ASSIGN(_lineBreakMode, lineBreakMode);
}

- (void) setMinimumFontSize: (NSString *) minimumFontSize
{
  ASSIGN(_minimumFontSize, minimumFontSize);
}

- (void) setMultipleTouchEnabled: (BOOL) multipleTouchEnabled
{
  _multipleTouchEnabled = multipleTouchEnabled;
}

- (void) setOpaque: (BOOL) opaque
{
  _opaque = opaque;
}

- (void) setText: (NSString *) text
{
  ASSIGN(_text, text);
}

- (void) setTextAlignment: (NSString *) textAlignment
{
  ASSIGN(_textAlignment, textAlignment);
}

- (void) setTranslatesAutoresizingMaskIntoConstraints: (BOOL) translatesAutoresizingMaskIntoConstraints
{
  _translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints;
}

- (void) setUserInteractionEnabled: (BOOL) userInteractionEnabled
{
  _userInteractionEnabled = userInteractionEnabled;
}

- (NSString *) text
{
  return _text;
}

- (NSString *) textAlignment
{
  return _textAlignment;
}

- (BOOL) translatesAutoresizingMaskIntoConstraints
{
  return _translatesAutoresizingMaskIntoConstraints;
}

- (BOOL) userInteractionEnabled
{
  return _userInteractionEnabled;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBLabel* acopy = [[XIBLabel allocWithZone: zone] init];








   [acopy setAdjustsFontSizeToFit: [self adjustsFontSizeToFit]];
   [acopy setBaselineAdjustment: [self baselineAdjustment]];
   [acopy setClipsSubviews: [self clipsSubviews]];
   [acopy setContentMode: [self contentMode]];
   [acopy setID: [self ID]];
   [acopy setLineBreakMode: [self lineBreakMode]];
   [acopy setMinimumFontSize: [self minimumFontSize]];
   [acopy setMultipleTouchEnabled: [self multipleTouchEnabled]];
   [acopy setOpaque: [self opaque]];
   [acopy setText: [self text]];
   [acopy setTextAlignment: [self textAlignment]];
   [acopy setTranslatesAutoresizingMaskIntoConstraints: [self translatesAutoresizingMaskIntoConstraints]];
   [acopy setUserInteractionEnabled: [self userInteractionEnabled]];




   return acopy;
}
@end
