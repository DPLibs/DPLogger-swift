//
//  DPLogger.swift
//  Demo
//
//  Created by Дмитрий Поляков on 03.10.2022.
//

import Foundation


 






public protocol DPLoggable {
    
//    static var isLoggableEnabled: Bool { get }
//    var isLoggingEnabled: Bool { get set }
    
//    static func log(method: String?, _ items: Any...)
//    static func log(_ items: Any...)
//    
//    static func logError(method: String?, _ error: Error?)
//    static func logError(_ error: Error?)
}

public extension DPLoggable {
    
    func log(_ logger: DPLoggerProtocol) {
        print(logger.prepareContentPrintString())
    }
    
    func log(method: String?, items: Any...) {
        let logger = DPNormalLogger(className: String(describing: Self.self), methodName: method, items: items)
        self.log(logger)
    }
    
    func log(method: String?, parameters: DPLoggerParameter...) {
        let logger = DPParametersLogger(className: String(describing: Self.self), methodName: method, parameters: parameters)
        self.log(logger)
    }
    
    func log(method: String?, error: Error?) {
        let logger = DPErrorLogger(className: String(describing: Self.self), methodName: method, error: error)
        self.log(logger)
    }
    
//    static var isLoggableEnabled: Bool {
//        true
//    }
    
//    static func log(method: String?, _ items: Any...) {
//        guard self.isLoggableEnabled else { return }
//
//        let className = String(describing: Self.self)
//        var printItems: [String] = ["[\(className)]"]
//
//        if let method = method {
//            printItems += ["[\(method)]"]
//        }
//
//        printItems += items.map({ "\($0)" })
//        print(printItems.joined(separator: " - "))
//    }
    
//    static func log(method: String?, _ items: Any...) {
////        guard self.isLoggableEnabled else { return }
//
//        let mirror = Mirror(reflecting: self)
//        print(mirror.children.count)
//        mirror.children.forEach({
//            print("!!!, \($0.label)")
//        })
//
//        let className = String(describing: Self.self)
//
//        var title: String = "[\(className)]"
//
//        if let method = method {
//            title += " - [\(method)]"
//        }
//
//        var printItems: [String] = [title]
//        printItems += items.map({ "\t\($0)" })
//
//        let printString = printItems.joined(separator: "\n")
//
//        print(printString)
//    }
//
//    func log(method: String?, _ items: Any...) {
////        guard self.isLoggableEnabled else { return }
//
//        let mirror = Mirror(reflecting: self)
//        print(mirror.children.count)
//        mirror.children.forEach({
//            print("!!!, \($0.label)")
//        })
//
//        let className = String(describing: Self.self)
//
//        var title: String = "[\(className)]"
//
//        if let method = method {
//            title += " - [\(method)]"
//        }
//
//        var printItems: [String] = [title]
//        printItems += items.map({ "\t\($0)" })
//
//        let printString = printItems.joined(separator: "\n")
//
//        print(printString)
//    }
//
//    static func log(_ items: Any...) {
//        self.log(method: nil, items)
//    }
//
//    static func logError(method: String?, _ error: Error?) {
//        guard let error = error else { return }
//        self.log(method: method, "error: \(error.localizedDescription)")
//    }
//
//    static func logError(_ error: Error?) {
//        self.logError(method: nil, error)
//    }
    
}
