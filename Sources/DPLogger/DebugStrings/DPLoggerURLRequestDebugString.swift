//
//  File.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPLoggerURLRequestDebugString {
    
    // MARK: - Init
    public init(title: DPLoggerTitleDebugString, urlRequest: URLRequest) {
        self.title = title
        self.urlRequest = urlRequest
    }
    
    // MARK: - Props
    public let title: DPLoggerTitleDebugString
    public let urlRequest: URLRequest
}

// MARK: - CustomDebugStringConvertible
extension DPLoggerURLRequestDebugString: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        [
            self.title.debugDescription + " - URLRequest:",
            DPLoggerURLRequestContentDebugString(urlRequest: self.urlRequest, linePrefix: "\t").debugDescription
        ].joined(separator: "\n")
    }
    
}
