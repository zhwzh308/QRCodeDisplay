//
//  QRViewController.swift
//  QRDisplay
//
//  Created by Wenzhong Zhang on 2019-08-14.
//  Copyright © 2019 Rthm Technologies Inc. All rights reserved.
//

import UIKit

open class QRViewController: UIViewController {
    @IBOutlet public weak var dataSource: QRViewControllerDataSource?
    @IBOutlet public weak var delegate: QRViewControllerDelegate?
    private let backingView = UIImageView()
    open override func loadView() {
        view = backingView
    }
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defer {
            delegate?.willShow(backingView)
        }
        reloadData()
    }
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delegate?.didShow?(backingView)
    }
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.willDisappear?(backingView)
    }
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.didDisappear(backingView)
    }
    open func reloadData() {
        if backingView.image != nil {
            UIView.transition(with: backingView, duration: 0.25, options: .transitionCrossDissolve, animations: { [unowned self] in
                self.backingView.image = nil
            }) { [weak self] _ in
                guard let `self` = self else { return }
                self.delegate?.didDisappear(self.backingView)
                self.emptyReload()
            }
        } else {
            emptyReload()
        }
    }
    private func emptyReload() {
        guard let dataSource = dataSource else { return }
        let data = dataSource.qrCodeData()
        guard let image = generateQR(data) else { return }
        UIView.transition(with: backingView, duration: 0.25, options: .transitionCrossDissolve, animations: {
            self.backingView.image = image
        }, completion: nil)
    }
    private func generateQR(_ data: Data) -> UIImage? {
        //CIQRCodeGenerator
        let qrCodeGenerator = QRCodeGenerator(message: data, correction: .H),
        viewSize = view.frame.size
        guard
            let output = qrCodeGenerator.resizeTo(viewSize)
            else { return nil }
        let uiImage = UIImage(ciImage: output)
        return uiImage
    }
}
