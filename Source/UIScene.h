/* Class Header:XIBScene */
#ifndef __XIBScene_H_
#define __XIBScene_H_

#import <Foundation/Foundation.h>

@class XIBPoint;

@interface XIBScene : NSObject
{
  XIBPoint* _canvasLocation;
  NSMutableArray* _objects;
  NSString* _sceneID;
}

- (NSMutableArray *) objects;
- (NSString *) sceneID;
- (void) setObjects: (NSMutableArray *) objects;
- (void) setSceneID: (NSString *) sceneID;

@end

#endif
