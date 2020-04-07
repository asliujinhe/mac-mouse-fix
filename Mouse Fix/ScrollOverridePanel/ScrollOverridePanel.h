//
// --------------------------------------------------------------------------
// ScrollOverride.h
// Created for Mac Mouse Fix (https://github.com/noah-nuebling/mac-mouse-fix)
// Created by Noah Nuebling in 2020
// Licensed under MIT
// --------------------------------------------------------------------------
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScrollOverridePanel : NSWindowController <NSTableViewDataSource, NSTableViewDelegate, NSDraggingDestination>
// Because this is a window controller, instances also have a `window` property which doesn't have to be declared here.
+ (ScrollOverridePanel *)instance;
- (void)openWindow;
@end

NS_ASSUME_NONNULL_END
