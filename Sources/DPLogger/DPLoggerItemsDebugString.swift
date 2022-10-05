//
//  DPLoggerItemsDebugString.swift
//  Demo
//
//  Created by Дмитрий Поляков on 05.10.2022.
//

import Foundation

public struct DPLoggerItemsDebugString {
    
    // MARK: - Init
    public init(title: DPLoggerTitleDebugString, items: [Any], titleTerminator: String = " ", itemsSeparator: String = " ") {
        self.title = title
        self.items = items
        self.titleTerminator = titleTerminator
        self.itemsSeparator = itemsSeparator
    }
    
    // MARK: - Props
    public let title: DPLoggerTitleDebugString
    public let items: [Any]
    public let titleTerminator: String
    public let itemsSeparator: String
}

// MARK: - CustomDebugStringConvertible
extension DPLoggerItemsDebugString: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        let titleString = self.title.debugDescription
        
        let contentString = self.items
            .map({ "\($0)" })
            .joined(separator: self.itemsSeparator)
        
        let string = [titleString, contentString]
            .filter({ !$0.isEmpty })
            .joined(separator: self.titleTerminator)
        
        return string
    }
    
}
