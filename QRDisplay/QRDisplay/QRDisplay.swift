//
//  QRDisplay.swift
//  QRDisplay
//
//  Created by Wenzhong Zhang on 2019-08-14.
//  Copyright © 2019 Rthm Technologies Inc. All rights reserved.
//
import Foundation
import os.log

private let identifier = "qrdisplay"

let bundleId = Bundle.main.bundleIdentifier ?? identifier

class QRDisplay {
    static let oslog: OSLog = {
        let log = OSLog(subsystem: bundleId, category: identifier)
        return log
    }()
}
