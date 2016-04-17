/* Class Header:XIBTableViewCellContentView */
#ifndef __XIBTableViewCellContentView_H_
#define __XIBTableViewCellContentView_H_

#import <Foundation/Foundation.h>

@class XIBAutoresizingMask;
@class XIBRect;

@interface XIBTableViewCellContentView : NSObject
{
  NSString* _ID;
  XIBAutoresizingMask* _autoresizingMask;
  BOOL _clipsSubviews;
  NSString* _contentMode;
  XIBRect* _frame;
  BOOL _multipleTouchEnabled;
  BOOL _opaque;
  NSMutableArray* _subviews;
  NSString* _tableViewCell;
}

- (NSString *) ID;
- (BOOL) clipsSubviews;
- (NSString *) contentMode;
- (BOOL) multipleTouchEnabled;
- (BOOL) opaque;
- (void) setClipsSubviews: (BOOL) clipsSubviews;
- (void) setContentMode: (NSString *) contentMode;
- (void) setID: (NSString *) ID;
- (void) setMultipleTouchEnabled: (BOOL) multipleTouchEnabled;
- (void) setOpaque: (BOOL) opaque;
- (void) setSubviews: (NSMutableArray *) subviews;
- (void) setTableViewCell: (NSString *) tableViewCell;
- (NSMutableArray *) subviews;
- (NSString *) tableViewCell;

@end

#endif
