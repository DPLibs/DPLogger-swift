//
//  DPLoggerParametersDebugString.swift
//  Demo
//
//  Created by Дмитрий Поляков on 05.10.2022.
//

import Foundation

public struct DPLoggerParametersDebugString {
    
    // MARK: - Init
    public init(title: DPLoggerTitleDebugString, parameters: [DPLoggerParametersDebugString.Parameter]) {
        self.title = title
        self.parameters = parameters
    }
    
    // MARK: - Props
    public let title: DPLoggerTitleDebugString
    public let parameters: [Parameter]
}

// MARK: - Parameter
public extension DPLoggerParametersDebugString {
    
    struct Parameter: CustomDebugStringConvertible {
        
        // MARK: - Init
        public init(l label: String, v value: Any?) {
            self.label = label
            self.value = value
        }
        
        // MARK: - Props
        public let label: String
        public let value: Any?
        
        // MARK: - CustomDebugStringConvertible
        public var debugDescription: String {
            "\(self.label): \(self.value ?? "nil")"
        }
    }
    
}

// MARK: - CustomDebugStringConvertible
extension DPLoggerParametersDebugString: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        let titleString = self.title.debugDescription
        
        let contentString = self.parameters
            .map({ "\t\($0)" })
            .joined(separator: "\n")

        let string = [titleString, contentString]
            .filter({ !$0.isEmpty })
            .joined(separator: "\n")

        return string
    }
    
}
