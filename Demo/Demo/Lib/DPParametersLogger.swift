//
//  DPParametersLogger.swift
//  Demo
//
//  Created by Дмитрий Поляков on 03.10.2022.
//

import Foundation

public struct DPParametersLogger {
    
    public init(className: String, methodName: String?, parameters: [DPLoggerParameter]) {
        self.className = className
        self.methodName = methodName
        self.parameters = parameters
    }
    
    public let className: String
    public let methodName: String?
    public let parameters: [DPLoggerParameter]
}

extension DPParametersLogger: DPLoggerProtocol {
    
    public func prepareContentPrintString() -> String {

        var printItems: [String] = [
            "\(self.prepareTitlePringString()) - parameters:"
        ]
        printItems += self.parameters.map({ "\t" + $0.debugDescription })

        let result = printItems.joined(separator: "\n")

        return result
    }
    
}
