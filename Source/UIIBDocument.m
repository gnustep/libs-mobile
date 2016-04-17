/* Class Code:XIBIBDocument */

#import "XIBIBDocument.h"

#ifndef GNUSTEP
#import "XIBCommon.h"
#endif


@implementation XIBIBDocument 


- (instancetype) init
{
   self = [super init];
   if(self != nil) {
      _dependencies = nil;
      _inferredMetricsTieBreakers = nil;
      _initialViewController = nil;
      _propertyAccessControl = nil;
      _scenes = nil;
      _systemVersion = nil;
      _targetRuntime = nil;
      _toolsVersion = nil;
      _type = nil;
      _useAutolayout = NO;
      _useTraitCollections = NO;
      _version = nil;
   }
   return self;
}

- (NSMutableArray *) dependencies
{
  return _dependencies;
}

- (NSMutableArray *) inferredMetricsTieBreakers
{
  return _inferredMetricsTieBreakers;
}

- (NSString *) initialViewController
{
  return _initialViewController;
}

- (NSString *) propertyAccessControl
{
  return _propertyAccessControl;
}

- (NSMutableArray *) scenes
{
  return _scenes;
}

- (void) setDependencies: (NSMutableArray *) dependencies
{
  ASSIGN(_dependencies, dependencies);
}

- (void) setInferredMetricsTieBreakers: (NSMutableArray *) inferredMetricsTieBreakers
{
  ASSIGN(_inferredMetricsTieBreakers, inferredMetricsTieBreakers);
}

- (void) setInitialViewController: (NSString *) initialViewController
{
  ASSIGN(_initialViewController, initialViewController);
}

- (void) setPropertyAccessControl: (NSString *) propertyAccessControl
{
  ASSIGN(_propertyAccessControl, propertyAccessControl);
}

- (void) setScenes: (NSMutableArray *) scenes
{
  ASSIGN(_scenes, scenes);
}

- (void) setSystemVersion: (NSString *) systemVersion
{
  ASSIGN(_systemVersion, systemVersion);
}

- (void) setTargetRuntime: (NSString *) targetRuntime
{
  ASSIGN(_targetRuntime, targetRuntime);
}

- (void) setToolsVersion: (NSString *) toolsVersion
{
  ASSIGN(_toolsVersion, toolsVersion);
}

- (void) setType: (NSString *) type
{
  ASSIGN(_type, type);
}

- (void) setUseAutolayout: (BOOL) useAutolayout
{
  _useAutolayout = useAutolayout;
}

- (void) setUseTraitCollections: (BOOL) useTraitCollections
{
  _useTraitCollections = useTraitCollections;
}

- (void) setVersion: (NSString *) version
{
  ASSIGN(_version, version);
}

- (NSString *) systemVersion
{
  return _systemVersion;
}

- (NSString *) targetRuntime
{
  return _targetRuntime;
}

- (NSString *) toolsVersion
{
  return _toolsVersion;
}

- (NSString *) type
{
  return _type;
}

- (BOOL) useAutolayout
{
  return _useAutolayout;
}

- (BOOL) useTraitCollections
{
  return _useTraitCollections;
}

- (NSString *) version
{
  return _version;
}

- (instancetype) copyWithZone: (NSZone *)zone 
{
   XIBIBDocument* acopy = [[XIBIBDocument allocWithZone: zone] init];




   [acopy setDependencies: [self dependencies]];
   [acopy setInferredMetricsTieBreakers: [self inferredMetricsTieBreakers]];
   [acopy setInitialViewController: [self initialViewController]];
   [acopy setPropertyAccessControl: [self propertyAccessControl]];
   [acopy setScenes: [self scenes]];
   [acopy setSystemVersion: [self systemVersion]];
   [acopy setTargetRuntime: [self targetRuntime]];
   [acopy setToolsVersion: [self toolsVersion]];
   [acopy setType: [self type]];
   [acopy setUseAutolayout: [self useAutolayout]];
   [acopy setUseTraitCollections: [self useTraitCollections]];
   [acopy setVersion: [self version]];







   return acopy;
}
@end
