//
//  QRCodeGenerator.swift
//  QRDisplay
//
//  Created by Wenzhong Zhang on 2019-08-14.
//  Copyright © 2019 Rthm Technologies Inc. All rights reserved.
//

import UIKit

private let kMessage = "inputMessage"

open class QRCodeGenerator {
    public let
    correctionLevel: InputCorrectionLevel,
    message: Data
    let filter: CIFilterName = .qrCodeGen
    public var qrCodeImage: CIImage? {
        guard let qrFilter = filter.create(parameters) else { return nil }
        return qrFilter.outputImage
    }
    private var parameters: [String: Any] {
        return [
            kMessage: message,
            type(of: correctionLevel).key: correctionLevel.value
        ]
    }
    public required init(message: Data, correction: InputCorrectionLevel) {
        self.message = message
        correctionLevel = correction
    }
    public func resizeTo(_ size: CGSize) -> CIImage? {
        guard let output = qrCodeImage else { return nil }
        let
        affineTransform: CIFilterName = .affineTransform,
        outputSize = output.extent.size,
        inputTransform = CGAffineTransform(scaleX: size.width / outputSize.width,
                                           y: size.height / outputSize.height),
        result = affineTransform.apply(image: output, parameters: [kCIInputTransformKey : inputTransform])
        return result
    }
}
