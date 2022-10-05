//
//  DPLoggerErrorDebugString.swift
//  Demo
//
//  Created by Дмитрий Поляков on 05.10.2022.
//

import Foundation

public struct DPLoggerErrorDebugString {
    
    // MARK: - Init
    public init(title: DPLoggerTitleDebugString, error: Error?) {
        self.title = title
        self.error = error
    }
    
    // MARK: - Props
    public let title: DPLoggerTitleDebugString
    public let error: Error?
}

// MARK: - CustomDebugStringConvertible
extension DPLoggerErrorDebugString: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        var string = self.title.debugDescription + " - error:"
        
        if let error = self.error {
            string += "\n\tERROR - \(error.localizedDescription)"
        } else {
            string += " nil"
        }
        
        return string
    }
    
}
