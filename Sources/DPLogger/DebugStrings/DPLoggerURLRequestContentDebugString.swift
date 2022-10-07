//
//  File.swift
//  
//
//  Created by Дмитрий Поляков on 07.10.2022.
//

import Foundation

public struct DPLoggerURLRequestContentDebugString {
    
    // MARK: - Init
    public init(urlRequest: URLRequest, linePrefix: String = "") {
        self.urlRequest = urlRequest
        self.linePrefix = linePrefix
    }
    
    // MARK: - Props
    public let urlRequest: URLRequest
    public let linePrefix: String
}

// MARK: - CustomDebugStringConvertible
extension DPLoggerURLRequestContentDebugString: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        var content: [String] = []
        
        let urlString = "\(self.linePrefix)url: \(self.urlRequest.httpMethod ?? "GET") \(self.urlRequest.url?.absoluteString ?? "")"
        content += [urlString]
        
        if let headers = self.urlRequest.allHTTPHeaderFields, !headers.isEmpty {
            let headersString: String = [
                "\(self.linePrefix)headers:",
                headers.keys
                    .map({ key in
                        "\(self.linePrefix)\t\(key): \(headers[key] ?? "nil")"
                    })
                    .joined(separator: "\n")
            ].joined(separator: "\n")
            
            content += [headersString]
        } else {
            content += [
                "\(self.linePrefix)headers: nil"
            ]
        }
        
        if
            let url = self.urlRequest.url,
            let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true),
            let queryItems = urlComponents.queryItems,
            !queryItems.isEmpty
        {
            let queryItemsString: String = [
                "\(self.linePrefix)queryItems:",
                queryItems
                    .map({ queryItem in
                        "\(self.linePrefix)\t\(queryItem.name): \(queryItem.value ?? "nil")"
                    })
                    .joined(separator: "\n")
            ].joined(separator: "\n")
            
            content += [queryItemsString]
        } else {
            content += [
                "\(self.linePrefix)queryItems: nil"
            ]
        }
        
        if
            let httpBody = self.urlRequest.httpBody,
            let dictionary = try? JSONSerialization.jsonObject(with: httpBody, options: [.allowFragments]) as? [String: Any],
            !dictionary.isEmpty
        {
            let httpBodyString: String = [
                "\(self.linePrefix)httpBody:",
                dictionary.keys
                    .map({ key in
                        "\(self.linePrefix)\t\(key): \(dictionary[key] ?? "nil")"
                    })
                    .joined(separator: "\n")
            ].joined(separator: "\n")
            
            content += [httpBodyString]
        } else {
            content += [
                "\(self.linePrefix)httpBody: nil"
            ]
        }
        
        return content.joined(separator: "\n")
    }
    
}
