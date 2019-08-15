//
//  ScreenBrightnessOperation.swift
//  QRDisplay
//
//  Created by Wenzhong Zhang on 2019-08-14.
//  Copyright © 2019 Rthm Technologies Inc. All rights reserved.
//

import UIKit

public class ScreenBrightnessOperation: ScreenOperation {
    private let
    previousBrightness: CGFloat,
    targetBrightness: CGFloat
    private var decimalTicks: TimeInterval = 0
    private var delta: CGFloat {
        return targetBrightness - previousBrightness
    }
    private var increment: CGFloat {
        return delta / CGFloat(decimalTicks)
    }
    private var ticks: Int {
        return Int(decimalTicks)
    }
    public init(_ screen: UIScreen, target brightness: CGFloat, duration: TimeInterval) {
        targetBrightness = brightness
        previousBrightness = screen.brightness
        super.init(screen)
        decimalTicks = floor(TimeInterval(fps) * duration)
        stepsRemaining = ticks
    }
    convenience public init(target brightness: CGFloat, duration: TimeInterval) {
        self.init(.main, target: brightness, duration: duration)
    }
    convenience public init(_ targetBrightness: CGFloat) {
        self.init(target: targetBrightness, duration: 2)
    }
    public override func cancel() {
        super.cancel()
        link = nil
        screen.brightness = previousBrightness
        finish()
    }
    public override func work() {
        super.work()
        screen.brightness += increment
    }
}
