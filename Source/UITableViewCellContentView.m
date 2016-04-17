/* Class Code:XIBTableViewCellContentView */

#import "XIBTableViewCellContentView.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif

#import "XIBAutoresizingMask.h"
#import "XIBRect.h"

@implementation XIBTableViewCellContentView 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _autoresizingMask = nil;
      _clipsSubviews = NO;
      _contentMode = nil;
      _frame = nil;
      _multipleTouchEnabled = NO;
      _opaque = NO;
      _subviews = nil;
      _tableViewCell = nil;
   }
   return self;
}

- (NSString *) ID
{
  return _ID;
}

- (BOOL) clipsSubviews
{
  return _clipsSubviews;
}

- (NSString *) contentMode
{
  return _contentMode;
}

- (BOOL) multipleTouchEnabled
{
  return _multipleTouchEnabled;
}

- (BOOL) opaque
{
  return _opaque;
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

- (void) setMultipleTouchEnabled: (BOOL) multipleTouchEnabled
{
  _multipleTouchEnabled = multipleTouchEnabled;
}

- (void) setOpaque: (BOOL) opaque
{
  _opaque = opaque;
}

- (void) setSubviews: (NSMutableArray *) subviews
{
  ASSIGN(_subviews, subviews);
}

- (void) setTableViewCell: (NSString *) tableViewCell
{
  ASSIGN(_tableViewCell, tableViewCell);
}

- (NSMutableArray *) subviews
{
  return _subviews;
}

- (NSString *) tableViewCell
{
  return _tableViewCell;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBTableViewCellContentView* acopy = [[XIBTableViewCellContentView allocWithZone: zone] init];




   [acopy setClipsSubviews: [self clipsSubviews]];
   [acopy setContentMode: [self contentMode]];
   [acopy setID: [self ID]];
   [acopy setMultipleTouchEnabled: [self multipleTouchEnabled]];
   [acopy setOpaque: [self opaque]];
   [acopy setSubviews: [self subviews]];
   [acopy setTableViewCell: [self tableViewCell]];


   return acopy;
}
@end
