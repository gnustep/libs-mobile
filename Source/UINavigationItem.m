/* Class Code:XIBNavigationItem */

#import "XIBNavigationItem.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBNavigationItem 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _ID = nil;
      _title = nil;
   }
   return self;
}

- (NSString *) ID
{
  return _ID;
}

- (void) setID: (NSString *) ID
{
  ASSIGN(_ID, ID);
}

- (void) setTitle: (NSString *) title
{
  ASSIGN(_title, title);
}

- (NSString *) title
{
  return _title;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBNavigationItem* acopy = [[XIBNavigationItem allocWithZone: zone] init];
   [acopy setID: [self ID]];
   [acopy setTitle: [self title]];

   return acopy;
}
@end
