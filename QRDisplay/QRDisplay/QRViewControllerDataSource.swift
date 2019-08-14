//
//  QRViewControllerDataSource.swift
//  QRDisplay
//
//  Created by Wenzhong Zhang on 2019-08-14.
//  Copyright © 2019 Rthm Technologies Inc. All rights reserved.
//

import Foundation

@objc public protocol QRViewControllerDataSource: class {
    @objc optional func qrCodeInputCorrectionLevel() -> InputCorrectionLevel
    func qrCodeData() -> Data
}
