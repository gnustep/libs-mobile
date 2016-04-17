/* Class Header:XIBLabel */
#ifndef __XIBLabel_H_
#define __XIBLabel_H_

#import <Foundation/Foundation.h>

@class XIBAutoresizingMask;
@class XIBColor;
@class XIBFontDescription;
@class XIBRect;
@class XIBNil;
@class XIBColor;

@interface XIBLabel : NSObject
{
  NSString* _ID;
  BOOL _adjustsFontSizeToFit;
  XIBAutoresizingMask* _autoresizingMask;
  XIBColor* _backgroundColor;
  NSString* _baselineAdjustment;
  BOOL _clipsSubviews;
  NSString* _contentMode;
  XIBFontDescription* _fontDescription;
  XIBRect* _frame;
  XIBNil* _highlightedColor;
  NSString* _lineBreakMode;
  NSString* _minimumFontSize;
  BOOL _multipleTouchEnabled;
  BOOL _opaque;
  NSString* _text;
  NSString* _textAlignment;
  XIBColor* _textColor;
  BOOL _translatesAutoresizingMaskIntoConstraints;
  BOOL _userInteractionEnabled;
}

- (NSString *) ID;
- (BOOL) adjustsFontSizeToFit;
- (NSString *) baselineAdjustment;
- (BOOL) clipsSubviews;
- (NSString *) contentMode;
- (NSString *) lineBreakMode;
- (NSString *) minimumFontSize;
- (BOOL) multipleTouchEnabled;
- (BOOL) opaque;
- (void) setAdjustsFontSizeToFit: (BOOL) adjustsFontSizeToFit;
- (void) setBaselineAdjustment: (NSString *) baselineAdjustment;
- (void) setClipsSubviews: (BOOL) clipsSubviews;
- (void) setContentMode: (NSString *) contentMode;
- (void) setID: (NSString *) ID;
- (void) setLineBreakMode: (NSString *) lineBreakMode;
- (void) setMinimumFontSize: (NSString *) minimumFontSize;
- (void) setMultipleTouchEnabled: (BOOL) multipleTouchEnabled;
- (void) setOpaque: (BOOL) opaque;
- (void) setText: (NSString *) text;
- (void) setTextAlignment: (NSString *) textAlignment;
- (void) setTranslatesAutoresizingMaskIntoConstraints: (BOOL) translatesAutoresizingMaskIntoConstraints;
- (void) setUserInteractionEnabled: (BOOL) userInteractionEnabled;
- (NSString *) text;
- (NSString *) textAlignment;
- (BOOL) translatesAutoresizingMaskIntoConstraints;
- (BOOL) userInteractionEnabled;

@end

#endif
