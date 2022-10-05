//
//  DPLoggerTitleDebugString.swift
//  Demo
//
//  Created by Дмитрий Поляков on 05.10.2022.
//

import Foundation

public struct DPLoggerTitleDebugString {
    
    // MARK: - Init
    public init(className: String, functionName: String) {
        self.className = className
        self.functionName = functionName
    }
    
    // MARK: - Props
    public let className: String
    public let functionName: String
}

// MARK: - CustomDebugStringConvertible
extension DPLoggerTitleDebugString: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        [self.className, self.functionName]
            .filter({ !$0.isEmpty })
            .map({ "[\($0)]" })
            .joined(separator: " - ")
    }
    
}
