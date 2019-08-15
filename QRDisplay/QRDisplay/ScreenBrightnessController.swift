//
//  ScreenBrightnessController.swift
//  QRDisplay
//
//  Created by Wenzhong Zhang on 2019-08-14.
//  Copyright © 2019 Rthm Technologies Inc. All rights reserved.
//

import UIKit

open class ScreenBrightnessController {
    private let screen: UIScreen
    public let initialBrightness: CGFloat
    init(_ screen: UIScreen) {
        self.screen = screen
        initialBrightness = screen.brightness
    }
}
