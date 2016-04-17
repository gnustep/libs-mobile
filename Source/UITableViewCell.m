/* Class Code:XIBTableViewCell */

#import "XIBTableViewCell.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif

#import "XIBAutoresizingMask.h"
#import "XIBColor.h"
#import "XIBTableViewCellContentView.h"
#import "XIBRect.h"

@implementation XIBTableViewCell 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _autoresizingMask = nil;
      _backgroundColor = nil;
      _connections = nil;
      _contentMode = nil;
      _contentView = nil;
      _frame = nil;
      _hidesAccessoryWhenEditing = NO;
      _indentationLevel = nil;
      _indentationWidth = nil;
      _reuseIdentifier = nil;
      _selectionStyle = nil;
      _style = nil;
      _textLabel = nil;
   }
   return self;
}

- (NSString *) ID
{
  return _ID;
}

- (NSMutableArray *) connections
{
  return _connections;
}

- (NSString *) contentMode
{
  return _contentMode;
}

- (BOOL) hidesAccessoryWhenEditing
{
  return _hidesAccessoryWhenEditing;
}

- (NSString *) indentationLevel
{
  return _indentationLevel;
}

- (NSString *) indentationWidth
{
  return _indentationWidth;
}

- (NSString *) reuseIdentifier
{
  return _reuseIdentifier;
}

- (NSString *) selectionStyle
{
  return _selectionStyle;
}

- (void) setConnections: (NSMutableArray *) connections
{
  ASSIGN(_connections, connections);
}

- (void) setContentMode: (NSString *) contentMode
{
  ASSIGN(_contentMode, contentMode);
}

- (void) setHidesAccessoryWhenEditing: (BOOL) hidesAccessoryWhenEditing
{
  _hidesAccessoryWhenEditing = hidesAccessoryWhenEditing;
}

- (void) setID: (NSString *) ID
{
  ASSIGN(_ID, ID);
}

- (void) setIndentationLevel: (NSString *) indentationLevel
{
  ASSIGN(_indentationLevel, indentationLevel);
}

- (void) setIndentationWidth: (NSString *) indentationWidth
{
  ASSIGN(_indentationWidth, indentationWidth);
}

- (void) setReuseIdentifier: (NSString *) reuseIdentifier
{
  ASSIGN(_reuseIdentifier, reuseIdentifier);
}

- (void) setSelectionStyle: (NSString *) selectionStyle
{
  ASSIGN(_selectionStyle, selectionStyle);
}

- (void) setStyle: (NSString *) style
{
  ASSIGN(_style, style);
}

- (void) setTextLabel: (NSString *) textLabel
{
  ASSIGN(_textLabel, textLabel);
}

- (NSString *) style
{
  return _style;
}

- (NSString *) textLabel
{
  return _textLabel;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBTableViewCell* acopy = [[XIBTableViewCell allocWithZone: zone] init];







   [acopy setConnections: [self connections]];
   [acopy setContentMode: [self contentMode]];
   [acopy setHidesAccessoryWhenEditing: [self hidesAccessoryWhenEditing]];
   [acopy setID: [self ID]];
   [acopy setIndentationLevel: [self indentationLevel]];
   [acopy setIndentationWidth: [self indentationWidth]];
   [acopy setReuseIdentifier: [self reuseIdentifier]];
   [acopy setSelectionStyle: [self selectionStyle]];
   [acopy setStyle: [self style]];
   [acopy setTextLabel: [self textLabel]];


   return acopy;
}
@end
