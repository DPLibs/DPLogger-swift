//
//  DPLoggerParameter.swift
//  Demo
//
//  Created by Дмитрий Поляков on 03.10.2022.
//

import Foundation

public struct DPLoggerParameter {
    
    public init(label: String, value: Any?) {
        self.label = label
        self.value = value
    }
    
    public let label: String
    public let value: Any?
}

extension DPLoggerParameter: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        "\(self.label): \(self.value ?? "nil")"
    }
    
}
