//
//  ScreenOperation.swift
//  QRDisplay
//
//  Created by Wenzhong Zhang on 2019-08-14.
//  Copyright © 2019 Rthm Technologies Inc. All rights reserved.
//

import os.log
import UIKit

public class ScreenOperation: SwiftAsyncOperation {
    let screen: UIScreen
    var fps: Int {
        return screen.maximumFramesPerSecond
    }
    var link: CADisplayLink? {
        didSet {
            if let old = oldValue {
                old.invalidate()
            }
        }
    }
    var stepsRemaining: Int = 1
    deinit {
        if let old = link {
            old.invalidate()
        }
    }
    init(_ screen: UIScreen) {
        self.screen = screen
        super.init()
    }
    override init() {
        screen = .main
        super.init()
    }
    override public func start() {
        if isCancelled {
            finish()
            return
        }
        _executing = true
        loadDisplayLink()
    }
    open func work() {
    }
    func loadDisplayLink() {
        guard link == nil else {
            os_log(.info, log: QRDisplay.oslog, "Display link was already installed")
            return
        }
        guard let l = screen.displayLink(withTarget: self, selector: #selector(brightnessChanging)) else {
            os_log(.info, log: QRDisplay.oslog, "Unable to obtain a display link")
            return
        }
        l.add(to: .main, forMode: .default)
        link = l
    }
    @objc private func brightnessChanging(_ sender: CADisplayLink) {
        switch stepsRemaining {
        case ...0:
            link = nil
            finish()
        default:
            work()
            stepsRemaining -= 1
        }
    }
}
