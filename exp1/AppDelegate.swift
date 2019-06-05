//
//  AppDelegate.swift
//  exp1
//
//  Created by baloran on 05/06/2019.
//  Copyright © 2019 baloran. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

