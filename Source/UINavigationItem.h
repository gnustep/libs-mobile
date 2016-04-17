/* Class Header:XIBNavigationItem */
#ifndef __XIBNavigationItem_H_
#define __XIBNavigationItem_H_

#import <Foundation/Foundation.h>


@interface XIBNavigationItem : NSObject
{
  NSString* _ID;
  NSString* _title;
}

- (NSString *) ID;
- (void) setID: (NSString *) ID;
- (void) setTitle: (NSString *) title;
- (NSString *) title;

@end

#endif
