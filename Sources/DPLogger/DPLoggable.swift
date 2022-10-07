//
//  DPLoggable.swift
//  Demo
//
//  Created by Дмитрий Поляков on 03.10.2022.
//

import Foundation

public protocol DPLoggable {
    var isDPLoggingEnabled: Bool { get set }
}

// MARK: - Methods
public extension DPLoggable {
    
    func log(debugString: CustomDebugStringConvertible) {
        guard self.isDPLoggingEnabled else { return }
        print(debugString)
    }
    
    func log(_ items: Any..., functionName: String = #function, titleTerminator: String = " ", itemsSeparator: String = " ") {
        let title = DPLoggerTitleDebugString(
            className: String(describing: Self.self),
            functionName: functionName
        )
        
        let debugString = DPLoggerItemsDebugString(
            title: title,
            items: items,
            titleTerminator: titleTerminator,
            itemsSeparator: itemsSeparator
        )
        
        self.log(debugString: debugString)
    }
    
    func log(parameters: DPLoggerParametersDebugString.Parameter..., functionName: String = #function) {
        let title = DPLoggerTitleDebugString(
            className: String(describing: Self.self),
            functionName: functionName
        )
        
        let debugString = DPLoggerParametersDebugString(
            title: title,
            parameters: parameters
        )
        
        self.log(debugString: debugString)
    }
    
    func log(error: Error?, functionName: String = #function) {
        let title = DPLoggerTitleDebugString(
            className: String(describing: Self.self),
            functionName: functionName
        )
        
        let debugString = DPLoggerErrorDebugString(
            title: title,
            error: error
        )
        
        self.log(debugString: debugString)
    }
    
    func log(urlRequest: URLRequest, functionName: String = #function) {
        let title = DPLoggerTitleDebugString(
            className: String(describing: Self.self),
            functionName: functionName
        )
        
        let debugString = DPLoggerURLRequestDebugString(
            title: title,
            urlRequest: urlRequest
        )
        
        self.log(debugString: debugString)
    }
    
    func log(
        urlRequest: URLRequest,
        urlReponse: URLResponse?,
        data: Data?,
        error: Error?,
        functionName: String = #function
    ) {
        let title = DPLoggerTitleDebugString(
            className: String(describing: Self.self),
            functionName: functionName
        )
        
        let debugString = DPLoggerDataTaskCompletionDebugString(
            title: title,
            urlRequest: urlRequest,
            urlReponse: urlReponse,
            data: data,
            error: error
        )
        
        self.log(debugString: debugString)
    }
    
}
