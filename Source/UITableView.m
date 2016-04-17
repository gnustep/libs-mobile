/* Class Code:XIBTableView */

#import "XIBTableView.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif

#import "XIBAutoresizingMask.h"
#import "XIBColor.h"
#import "XIBRect.h"

@implementation XIBTableView 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _alwaysBounceVertical = NO;
      _autoresizingMask = nil;
      _backgroundColor = nil;
      _clipsSubviews = NO;
      _connections = nil;
      _contentMode = nil;
      _dataMode = nil;
      _frame = nil;
      _prototypes = nil;
      _rowHeight = nil;
      _sectionFooterHeight = nil;
      _sectionHeaderHeight = nil;
      _sections = nil;
      _separatorStyle = nil;
      _style = nil;
   }
   return self;
}

- (NSString *) ID
{
  return _ID;
}

- (BOOL) alwaysBounceVertical
{
  return _alwaysBounceVertical;
}

- (BOOL) clipsSubviews
{
  return _clipsSubviews;
}

- (NSMutableArray *) connections
{
  return _connections;
}

- (NSString *) contentMode
{
  return _contentMode;
}

- (NSString *) dataMode
{
  return _dataMode;
}

- (NSMutableArray *) prototypes
{
  return _prototypes;
}

- (NSString *) rowHeight
{
  return _rowHeight;
}

- (NSString *) sectionFooterHeight
{
  return _sectionFooterHeight;
}

- (NSString *) sectionHeaderHeight
{
  return _sectionHeaderHeight;
}

- (NSMutableArray *) sections
{
  return _sections;
}

- (NSString *) separatorStyle
{
  return _separatorStyle;
}

- (void) setAlwaysBounceVertical: (BOOL) alwaysBounceVertical
{
  _alwaysBounceVertical = alwaysBounceVertical;
}

- (void) setClipsSubviews: (BOOL) clipsSubviews
{
  _clipsSubviews = clipsSubviews;
}

- (void) setConnections: (NSMutableArray *) connections
{
  ASSIGN(_connections, connections);
}

- (void) setContentMode: (NSString *) contentMode
{
  ASSIGN(_contentMode, contentMode);
}

- (void) setDataMode: (NSString *) dataMode
{
  ASSIGN(_dataMode, dataMode);
}

- (void) setID: (NSString *) ID
{
  ASSIGN(_ID, ID);
}

- (void) setPrototypes: (NSMutableArray *) prototypes
{
  ASSIGN(_prototypes, prototypes);
}

- (void) setRowHeight: (NSString *) rowHeight
{
  ASSIGN(_rowHeight, rowHeight);
}

- (void) setSectionFooterHeight: (NSString *) sectionFooterHeight
{
  ASSIGN(_sectionFooterHeight, sectionFooterHeight);
}

- (void) setSectionHeaderHeight: (NSString *) sectionHeaderHeight
{
  ASSIGN(_sectionHeaderHeight, sectionHeaderHeight);
}

- (void) setSections: (NSMutableArray *) sections
{
  ASSIGN(_sections, sections);
}

- (void) setSeparatorStyle: (NSString *) separatorStyle
{
  ASSIGN(_separatorStyle, separatorStyle);
}

- (void) setStyle: (NSString *) style
{
  ASSIGN(_style, style);
}

- (NSString *) style
{
  return _style;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBTableView* acopy = [[XIBTableView allocWithZone: zone] init];











   [acopy setAlwaysBounceVertical: [self alwaysBounceVertical]];
   [acopy setClipsSubviews: [self clipsSubviews]];
   [acopy setConnections: [self connections]];
   [acopy setContentMode: [self contentMode]];
   [acopy setDataMode: [self dataMode]];
   [acopy setID: [self ID]];
   [acopy setPrototypes: [self prototypes]];
   [acopy setRowHeight: [self rowHeight]];
   [acopy setSectionFooterHeight: [self sectionFooterHeight]];
   [acopy setSectionHeaderHeight: [self sectionHeaderHeight]];
   [acopy setSections: [self sections]];
   [acopy setSeparatorStyle: [self separatorStyle]];
   [acopy setStyle: [self style]];

   return acopy;
}
@end
