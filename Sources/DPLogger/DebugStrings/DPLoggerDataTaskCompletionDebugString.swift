//
//  File.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPLoggerDataTaskCompletionDebugString {
    
    // MARK: - Init
    public init(
        title: DPLoggerTitleDebugString,
        urlRequest: URLRequest,
        urlReponse: URLResponse?,
        data: Data?,
        error: Error?
    ) {
        self.title = title
        self.urlRequest = urlRequest
        self.urlReponse = urlReponse
        self.data = data
        self.error = error
    }
    
    // MARK: - Props
    public let title: DPLoggerTitleDebugString
    public let urlRequest: URLRequest
    public let urlReponse: URLResponse?
    public let data: Data?
    public let error: Error?
}

// MARK: - CustomDebugStringConvertible
extension DPLoggerDataTaskCompletionDebugString: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        var content: [String] = [
            self.title.debugDescription,
            "\tREQUEST:",
            DPLoggerURLRequestContentDebugString(urlRequest: self.urlRequest, linePrefix: "\t\t").debugDescription
        ]
        
        if let httpURLResponse = self.urlReponse as? HTTPURLResponse {
            var httpURLResponseContent: [String] = [
                "\tRESPONSE:",
                "\t\tstatusCode: \(httpURLResponse.statusCode)"
            ]
            
            let headers = httpURLResponse.allHeaderFields
            if !headers.isEmpty {
                let headersString: String = [
                    "\t\theaders:",
                    headers.keys
                        .map({ "\t\t\t\($0): \(headers[$0] ?? "nil")" })
                        .joined(separator: "\n")
                ].joined(separator: "\n")
                
                httpURLResponseContent += [headersString]
            } else {
                httpURLResponseContent += ["\t\theadres: nil"]
            }
            
            content += [httpURLResponseContent.joined(separator: "\n")]
        } else {
            content += ["\tRESPONSE: nil"]
        }
        
        if let data = self.data {
            if
                let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
                let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                let dataString: String = [
                    "\tDATA:",
                    String(decoding: jsonData, as: UTF8.self)
                ].joined(separator: "\n")
                content += [dataString]
            } else if let jsonString = String(data: data, encoding: .utf8) {
                let dataString: String = [
                    "\tDATA:",
                    "\t\t" + jsonString
                ].joined(separator: "\n")
                content += [dataString]
            } else {
                content += ["\tDATA: Not displayed"]
            }
        } else {
            content += ["\tDATA: nil"]
        }
        
        if let error = self.error {
            content += ["\tERROR: \(error.localizedDescription)"]
        } else {
            content += ["\tERROR: nil"]
        }
        
        return content.joined(separator: "\n")
    }
    
}
