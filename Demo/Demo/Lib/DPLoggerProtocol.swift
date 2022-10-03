//
//  DPLoggerProtocol.swift
//  Demo
//
//  Created by Дмитрий Поляков on 03.10.2022.
//

import Foundation

public protocol DPLoggerProtocol {
    var className: String { get }
    var methodName: String? { get }
    
    func prepareTitlePringString() -> String
    func prepareContentPrintString() -> String
}

public extension DPLoggerProtocol {
    
    func prepareTitlePringString() -> String {
        var result: String = "[\(self.className)]"

        if let method = self.methodName {
            result += " - [\(method)]"
        }
        
        return result
    }
    
}
