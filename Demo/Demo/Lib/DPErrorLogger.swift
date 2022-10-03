//
//  DPErrorLogger.swift
//  Demo
//
//  Created by Дмитрий Поляков on 03.10.2022.
//

import Foundation

struct DPErrorLogger {
    
    public init(className: String, methodName: String?, error: Error?) {
        self.className = className
        self.methodName = methodName
        self.error = error
    }
    
    public let className: String
    public let methodName: String?
    public let error: Error?
}

extension DPErrorLogger: DPLoggerProtocol {
    
    public func prepareContentPrintString() -> String {
        var printString: String = "\(self.prepareTitlePringString()) - error:"
        
        if let error = self.error {
            printString += "\n\tERROR \(error.localizedDescription)"
        } else {
            printString += " nil"
        }

        return printString
    }
    
}
