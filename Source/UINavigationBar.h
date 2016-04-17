/* Class Header:XIBNavigationBar */
#ifndef __XIBNavigationBar_H_
#define __XIBNavigationBar_H_

#import <Foundation/Foundation.h>

@class XIBAutoresizingMask;

@interface XIBNavigationBar : NSObject
{
  NSString* _ID;
  XIBAutoresizingMask* _autoresizingMask;
  BOOL _clipsSubviews;
  NSString* _contentMode;
  BOOL _multipleTouchEnabled;
}

- (NSString *) ID;
- (BOOL) clipsSubviews;
- (NSString *) contentMode;
- (BOOL) multipleTouchEnabled;
- (void) setClipsSubviews: (BOOL) clipsSubviews;
- (void) setContentMode: (NSString *) contentMode;
- (void) setID: (NSString *) ID;
- (void) setMultipleTouchEnabled: (BOOL) multipleTouchEnabled;

@end

#endif
