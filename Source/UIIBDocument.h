/* Class Header:XIBIBDocument */
#ifndef __XIBIBDocument_H_
#define __XIBIBDocument_H_

#import <Foundation/Foundation.h>


@interface XIBIBDocument : NSObject
{
  NSMutableArray* _dependencies;
  NSMutableArray* _inferredMetricsTieBreakers;
  NSString* _initialViewController;
  NSString* _propertyAccessControl;
  NSMutableArray* _scenes;
  NSString* _systemVersion;
  NSString* _targetRuntime;
  NSString* _toolsVersion;
  NSString* _type;
  BOOL _useAutolayout;
  BOOL _useTraitCollections;
  NSString* _version;
}

- (NSMutableArray *) dependencies;
- (NSMutableArray *) inferredMetricsTieBreakers;
- (NSString *) initialViewController;
- (NSString *) propertyAccessControl;
- (NSMutableArray *) scenes;
- (void) setDependencies: (NSMutableArray *) dependencies;
- (void) setInferredMetricsTieBreakers: (NSMutableArray *) inferredMetricsTieBreakers;
- (void) setInitialViewController: (NSString *) initialViewController;
- (void) setPropertyAccessControl: (NSString *) propertyAccessControl;
- (void) setScenes: (NSMutableArray *) scenes;
- (void) setSystemVersion: (NSString *) systemVersion;
- (void) setTargetRuntime: (NSString *) targetRuntime;
- (void) setToolsVersion: (NSString *) toolsVersion;
- (void) setType: (NSString *) type;
- (void) setUseAutolayout: (BOOL) useAutolayout;
- (void) setUseTraitCollections: (BOOL) useTraitCollections;
- (void) setVersion: (NSString *) version;
- (NSString *) systemVersion;
- (NSString *) targetRuntime;
- (NSString *) toolsVersion;
- (NSString *) type;
- (BOOL) useAutolayout;
- (BOOL) useTraitCollections;
- (NSString *) version;

@end

#endif
