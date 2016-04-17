/* Class Header:XIBViewControllerLayoutGuide */
#ifndef __XIBViewControllerLayoutGuide_H_
#define __XIBViewControllerLayoutGuide_H_

#import <Foundation/Foundation.h>


@interface XIBViewControllerLayoutGuide : NSObject
{
  NSString* _ID;
  NSString* _type;
}

- (NSString *) ID;
- (void) setID: (NSString *) ID;
- (void) setType: (NSString *) type;
- (NSString *) type;

@end

#endif
