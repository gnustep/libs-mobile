/* Class Code:XIBNavigationBar */

#import "XIBNavigationBar.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif

#import "XIBAutoresizingMask.h"

@implementation XIBNavigationBar 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _autoresizingMask = nil;
      _clipsSubviews = NO;
      _contentMode = nil;
      _multipleTouchEnabled = NO;
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

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBNavigationBar* acopy = [[XIBNavigationBar allocWithZone: zone] init];



   [acopy setClipsSubviews: [self clipsSubviews]];
   [acopy setContentMode: [self contentMode]];
   [acopy setID: [self ID]];
   [acopy setMultipleTouchEnabled: [self multipleTouchEnabled]];
   return acopy;
}
@end
