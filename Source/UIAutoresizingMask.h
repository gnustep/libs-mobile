/* Class Header:XIBAutoresizingMask */
#ifndef __XIBAutoresizingMask_H_
#define __XIBAutoresizingMask_H_

#import <Foundation/Foundation.h>


@interface XIBAutoresizingMask : NSObject
{
  BOOL _heightSizable;
  BOOL _widthSizable;
}

- (BOOL) heightSizable;
- (void) setHeightSizable: (BOOL) heightSizable;
- (void) setWidthSizable: (BOOL) widthSizable;
- (BOOL) widthSizable;

@end

#endif
