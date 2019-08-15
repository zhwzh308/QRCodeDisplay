//
//  SwiftAsyncOperation.swift
//  QRDisplay
//
//  Created by Wenzhong Zhang on 2019-08-14.
//  Copyright © 2019 Rthm Technologies Inc. All rights reserved.
//

import Foundation

open class SwiftAsyncOperation: AsyncOperation {
    open override var isExecuting: Bool { return _executing }
    open override var isFinished: Bool { return _finished }
    open override var isReady: Bool { return _ready }
    public var _executing = false {
        willSet {
            willChangeValue(for: \.isExecuting)
        }
        didSet {
            didChangeValue(for: \.isExecuting)
        }
    }
    public var _finished = false {
        willSet {
            willChangeValue(for: \.isFinished)
        }
        didSet {
            didChangeValue(for: \.isFinished)
        }
    }
    public var _ready = false {
        willSet {
            willChangeValue(for: \.isReady)
        }
        didSet {
            didChangeValue(for: \.isReady)
        }
    }
    public override init() {
        super.init()
        _ready = true
    }
    open func finish() {
        _executing = false
        _finished = true
    }
}
