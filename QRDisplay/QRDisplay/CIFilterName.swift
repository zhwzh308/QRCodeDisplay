//
//  CIFilterName.swift
//  QRDisplay
//
//  Created by Wenzhong Zhang on 2019-08-14.
//  Copyright © 2019 Rthm Technologies Inc. All rights reserved.
//

import UIKit

enum CIFilterName: String {
    case
    qrCodeGen = "CIQRCodeGenerator",
    affineTransform = "CIAffineTransform"
    func create(_ parameters: [String: Any]?) -> CIFilter? {
        return CIFilter(name: rawValue, parameters: parameters)
    }
    func apply(image: CIImage, parameters: [String: Any]? = nil) -> CIImage {
        guard let p = parameters else { return image.applyingFilter(rawValue) }
        return image.applyingFilter(rawValue, parameters: p)
    }
}
