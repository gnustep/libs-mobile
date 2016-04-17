/* Class Code:XIBScene */

#import "XIBScene.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif

#import "XIBPoint.h"

@implementation XIBScene 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _canvasLocation = nil;
      _objects = nil;
      _sceneID = nil;
   }
   return self;
}

- (NSMutableArray *) objects
{
  return _objects;
}

- (NSString *) sceneID
{
  return _sceneID;
}

- (void) setObjects: (NSMutableArray *) objects
{
  ASSIGN(_objects, objects);
}

- (void) setSceneID: (NSString *) sceneID
{
  ASSIGN(_sceneID, sceneID);
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBScene* acopy = [[XIBScene allocWithZone: zone] init];

   [acopy setObjects: [self objects]];
   [acopy setSceneID: [self sceneID]];
   return acopy;
}
@end
