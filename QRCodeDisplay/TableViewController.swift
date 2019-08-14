//
//  TableViewController.swift
//  QRCodeDisplay
//
//  Created by Wenzhong Zhang on 2019-08-14.
//  Copyright © 2019 Wenzhong Inc. All rights reserved.
//

import UIKit

final class TableViewController: UITableViewController {
    weak var qrViewController: QRCodeViewController?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let vc = segue.destination as? QRCodeViewController else { return }
        qrViewController = vc
    }
}

extension TableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        defer {
            textField.resignFirstResponder()
        }
        guard let text = textField.text else { return false }
        qrViewController?.text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        return true
    }
}
