//
//  InputCorrectionLevel.swift
//  QRDisplay
//
//  Created by Wenzhong Zhang on 2019-08-14.
//  Copyright © 2019 Rthm Technologies Inc. All rights reserved.
//

import Foundation

@objc public enum InputCorrectionLevel: Int {
    case L, M, Q, H
    public static let key = "inputCorrectionLevel"
    public var value: String {
        switch self {
        case .L:
            return "L"
        case .M:
            return "M"
        case .Q:
            return "Q"
        case .H:
            return "H"
        }
    }
}

extension InputCorrectionLevel: CustomStringConvertible {
    public var description: String {
        switch self {
        case .L:
            return "7%"
        case .M:
            return "15%"
        case .Q:
            return "25%"
        case .H:
            return "30%"
        }
    }
}
