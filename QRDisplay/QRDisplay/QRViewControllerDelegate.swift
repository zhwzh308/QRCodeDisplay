//
//  QRViewControllerDelegate.swift
//  QRDisplay
//
//  Created by Wenzhong Zhang on 2019-08-14.
//  Copyright © 2019 Rthm Technologies Inc. All rights reserved.
//

import UIKit

@objc public protocol QRViewControllerDelegate: class {
    func willShow(_ contentView: UIImageView)
    @objc optional func didShow(_ contentView: UIImageView)
    @objc optional func willDisappear(_ contentView: UIImageView)
    func didDisappear(_ contentView: UIImageView)
}
