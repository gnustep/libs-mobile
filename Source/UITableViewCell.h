/* Class Header:XIBTableViewCell */
#ifndef __XIBTableViewCell_H_
#define __XIBTableViewCell_H_

#import <Foundation/Foundation.h>

@class XIBAutoresizingMask;
@class XIBColor;
@class XIBTableViewCellContentView;
@class XIBRect;

@interface XIBTableViewCell : NSObject
{
  NSString* _ID;
  XIBAutoresizingMask* _autoresizingMask;
  XIBColor* _backgroundColor;
  NSMutableArray* _connections;
  NSString* _contentMode;
  XIBTableViewCellContentView* _contentView;
  XIBRect* _frame;
  BOOL _hidesAccessoryWhenEditing;
  NSString* _indentationLevel;
  NSString* _indentationWidth;
  NSString* _reuseIdentifier;
  NSString* _selectionStyle;
  NSString* _style;
  NSString* _textLabel;
}

- (NSString *) ID;
- (NSMutableArray *) connections;
- (NSString *) contentMode;
- (BOOL) hidesAccessoryWhenEditing;
- (NSString *) indentationLevel;
- (NSString *) indentationWidth;
- (NSString *) reuseIdentifier;
- (NSString *) selectionStyle;
- (void) setConnections: (NSMutableArray *) connections;
- (void) setContentMode: (NSString *) contentMode;
- (void) setHidesAccessoryWhenEditing: (BOOL) hidesAccessoryWhenEditing;
- (void) setID: (NSString *) ID;
- (void) setIndentationLevel: (NSString *) indentationLevel;
- (void) setIndentationWidth: (NSString *) indentationWidth;
- (void) setReuseIdentifier: (NSString *) reuseIdentifier;
- (void) setSelectionStyle: (NSString *) selectionStyle;
- (void) setStyle: (NSString *) style;
- (void) setTextLabel: (NSString *) textLabel;
- (NSString *) style;
- (NSString *) textLabel;

@end

#endif
