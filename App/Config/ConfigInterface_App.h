//
// --------------------------------------------------------------------------
// ConfigFileInterface_App.h
// Created for Mac Mouse Fix (https://github.com/noah-nuebling/mac-mouse-fix)
// Created by Noah Nuebling in 2019
// Licensed under MIT
// --------------------------------------------------------------------------
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConfigInterface_App : NSObject

/// Declarations
typedef enum {
    kMFConfigProblemNone = 0,
    kMFConfigProblemIncompleteAppOverride = 1
} MFConfigProblem;

/// Convenience functions
NSObject *config(NSString *keyPath);
void setConfig(NSString *keyPath, NSObject *object);
void commitConfig(void);

/// Storage
@property (class,retain) NSMutableDictionary *config;

/// Methods
+ (void)writeConfigToFileAndNotifyHelper;
+ (void)loadConfigFromFile;
+ (void)repairConfigWithProblem:(MFConfigProblem)problem info:(id _Nullable)info;
+ (void)cleanConfig;

@end

NS_ASSUME_NONNULL_END
