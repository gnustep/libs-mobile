/* Class Header:XIBTableView */
#ifndef __XIBTableView_H_
#define __XIBTableView_H_

#import <Foundation/Foundation.h>

@class XIBAutoresizingMask;
@class XIBColor;
@class XIBRect;

@interface XIBTableView : NSObject
{
  NSString* _ID;
  BOOL _alwaysBounceVertical;
  XIBAutoresizingMask* _autoresizingMask;
  XIBColor* _backgroundColor;
  BOOL _clipsSubviews;
  NSMutableArray* _connections;
  NSString* _contentMode;
  NSString* _dataMode;
  XIBRect* _frame;
  NSMutableArray* _prototypes;
  NSString* _rowHeight;
  NSString* _sectionFooterHeight;
  NSString* _sectionHeaderHeight;
  NSMutableArray* _sections;
  NSString* _separatorStyle;
  NSString* _style;
}

- (NSString *) ID;
- (BOOL) alwaysBounceVertical;
- (BOOL) clipsSubviews;
- (NSMutableArray *) connections;
- (NSString *) contentMode;
- (NSString *) dataMode;
- (NSMutableArray *) prototypes;
- (NSString *) rowHeight;
- (NSString *) sectionFooterHeight;
- (NSString *) sectionHeaderHeight;
- (NSMutableArray *) sections;
- (NSString *) separatorStyle;
- (void) setAlwaysBounceVertical: (BOOL) alwaysBounceVertical;
- (void) setClipsSubviews: (BOOL) clipsSubviews;
- (void) setConnections: (NSMutableArray *) connections;
- (void) setContentMode: (NSString *) contentMode;
- (void) setDataMode: (NSString *) dataMode;
- (void) setID: (NSString *) ID;
- (void) setPrototypes: (NSMutableArray *) prototypes;
- (void) setRowHeight: (NSString *) rowHeight;
- (void) setSectionFooterHeight: (NSString *) sectionFooterHeight;
- (void) setSectionHeaderHeight: (NSString *) sectionHeaderHeight;
- (void) setSections: (NSMutableArray *) sections;
- (void) setSeparatorStyle: (NSString *) separatorStyle;
- (void) setStyle: (NSString *) style;
- (NSString *) style;

@end

#endif
