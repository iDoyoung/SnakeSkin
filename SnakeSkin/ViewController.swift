//
//  ViewController.swift
//  SnakeSkin
//
//  Created by Doyoung on 2023/03/05.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOtherMouseDown()
    }
    
    ///Settings except for the right click button and left click button of the mouse
    ///RAZER DEATHADDER v2 PRO
    func setupOtherMouseDown() {
        NSEvent.addGlobalMonitorForEvents(matching: .otherMouseDown) { event in
            switch event.buttonNumber {
            case 2:
                self.showMissionControl()
            case 3:
                self.showPrevious()
            case 4:
                self.showNext()
            default:
                #if DEBUG
                print(event.buttonNumber)
                #endif
            }
        }
    }
    
    //MARK: - Actions
        
    //FIXME: Close Mission Control is not work
    //https://gist.github.com/eegrok/949034 -> List of virtualKey
    ///Control + Up Arrow, to show Mission Control
    func showMissionControl()  {
        let missionControlKey = CGEvent(keyboardEventSource: nil, virtualKey: 0x7E, keyDown: true)
        missionControlKey?.flags.insert(CGEventFlags.maskControl)
        missionControlKey?.post(tap: .cghidEventTap)
        let missionControlKeyUp = CGEvent(keyboardEventSource: nil, virtualKey: 0x7E, keyDown: false)
        missionControlKeyUp?.flags.insert(CGEventFlags.maskControl)
        missionControlKeyUp?.post(tap: .cghidEventTap)
    }
    
    ///Command + Left Arrow, to show previous
    func showPrevious() {
        let previousKey = CGEvent(keyboardEventSource: nil, virtualKey: 0x7B, keyDown: true)
        previousKey?.flags.insert(CGEventFlags.maskCommand)
        previousKey?.post(tap: .cgSessionEventTap)
        let previousKeyUp = CGEvent(keyboardEventSource: nil, virtualKey: 0x7B, keyDown: false)
        previousKeyUp?.flags.insert(CGEventFlags.maskCommand)
        previousKeyUp?.post(tap: .cgSessionEventTap)
    }
    
    ///Command + Right Arrow, to show next
    func showNext() {
        let nextKey = CGEvent(keyboardEventSource: nil, virtualKey: 0x7C, keyDown: true)
        nextKey?.flags.insert(CGEventFlags.maskCommand)
        nextKey?.post(tap: .cgSessionEventTap)
        let nextKeyUp = CGEvent(keyboardEventSource: nil, virtualKey: 0x7C, keyDown: false)
        nextKeyUp?.flags.insert(CGEventFlags.maskCommand)
        nextKeyUp?.post(tap: .cgSessionEventTap)
    }
}

