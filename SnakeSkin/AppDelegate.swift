//
//  AppDelegate.swift
//  SnakeSkin
//
//  Created by Doyoung on 2023/03/05.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    private let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        guard let image = NSImage(named: "icon-deathadder") else { return }
        image.size = NSSize(width: image.size.width/2, height: image.size.height/2)
        statusItem.button?.image = image
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showSetting)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

    @objc func showSetting() {
        
    }
}

