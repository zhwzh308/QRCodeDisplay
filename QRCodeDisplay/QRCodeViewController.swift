//
//  QRCodeViewController.swift
//  QRCodeDisplay
//
//  Created by Wenzhong Zhang on 2019-08-14.
//  Copyright © 2019 Wenzhong Inc. All rights reserved.
//

import QRDisplay
import UIKit

private let defaultBrightness: CGFloat = 0.3
private let scanningBrightness: CGFloat = 0.85

final class QRCodeViewController: QRViewController {
    var text = "Hello World!" {
        didSet {
            let capture = text
            guard capture != oldValue else {
                return
            }
            reloadData()
        }
    }
    private var previousBrightness = defaultBrightness
    private lazy var screen: UIScreen = .main
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
    }
}

extension QRCodeViewController: QRViewControllerDataSource {
    func qrCodeData() -> Data {
        guard let data = text.data(using: .isoLatin1) else { return Data() }
        return data
    }
}

extension QRCodeViewController: QRViewControllerDelegate {
    func willShow(_ contentView: UIImageView) {
        previousBrightness = screen.brightness
        let op = DisplayBrightnessChangeOperation(scanningBrightness)
        OperationQueue.main.addOperation(op)
    }
    func didDisappear(_ contentView: UIImageView) {
        let op = DisplayBrightnessChangeOperation(previousBrightness)
        OperationQueue.main.addOperation(op)
    }
}
