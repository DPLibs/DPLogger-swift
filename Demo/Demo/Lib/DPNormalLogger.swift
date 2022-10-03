//
//  DPNormalLogger.swift
//  Demo
//
//  Created by Дмитрий Поляков on 03.10.2022.
//

import Foundation

public struct DPNormalLogger {
    
    public init(className: String, methodName: String?, items: [Any]) {
        self.className = className
        self.methodName = methodName
        self.items = items
    }
    
    public let className: String
    public let methodName: String?
    public let items: [Any]
}

extension DPNormalLogger: DPLoggerProtocol {
    
    public func prepareContentPrintString() -> String {
        let title = "\(self.prepareTitlePringString())"
        
        var printItems: [String] = [title]
        printItems += self.items.map({ "\($0)" })

        let result = printItems.joined()

        return result
    }
    
}
