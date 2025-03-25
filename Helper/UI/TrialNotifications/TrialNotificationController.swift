//
// --------------------------------------------------------------------------
// TrialNotificationController.swift
// Created for Mac Mouse Fix (https://github.com/noah-nuebling/mac-mouse-fix)
// Created by Noah Nuebling in 2022
// Licensed under the MMF License (https://github.com/noah-nuebling/mac-mouse-fix/blob/master/License)
// --------------------------------------------------------------------------
//

/// Also see ToastNotifications in the mainApp. They work similarly.

import Cocoa
import CocoaLumberjackSwift

class TrialNotificationController: NSWindowController {

    
    /// Singleton
    @objc static let shared = TrialNotificationController(window: nil)
    
    /// Outlets & actions
    
    @IBOutlet var body: NSTextView!
    @IBOutlet weak var bodyScrollView: NSScrollView!
    
    @IBOutlet weak var applePayBadge: NSImageView!
    @IBOutlet weak var payButton: PayButton!
    
    
    @IBAction func closeButtonClick(_ sender: Any) {
        
        /// Close notification
        self.close()
        
        /// Wait for close animation to finish
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                
            /// Disable helper
            HelperServices.disableHelperFromHelper()
        })
    }
    
    /// Vars
    var trackingArea: NSTrackingArea? = nil
    var darkModeObservation: NSKeyValueObservation? = nil
    var spaceSwitchObservation: Any? = nil
    
    /// Init
    override init(window: NSWindow?) {
        
        if window == nil {
            super.init(window: nil)
            let nib = NSNib(nibNamed: "TrialNotificationController", bundle: nil)
            
            var topLevelObjects: NSArray?
            nib?.instantiate(withOwner: self, topLevelObjects: &topLevelObjects)
            self.window = topLevelObjects![0] as? NSWindow
            if self.window == nil {
                self.window = topLevelObjects![1] as! NSWindow
            }
            
            self.window?.collectionBehavior = .canJoinAllSpaces
            
        } else {
            super.init(window: window)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Lifecycle
    override func windowDidLoad() {
        super.windowDidLoad()

        /// Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    deinit {
        if let obs = self.spaceSwitchObservation {
            NSWorkspace.shared.notificationCenter.removeObserver(obs)
        }
    }
    
    /// Interface
    
    var firstAppearance = true
    
}
