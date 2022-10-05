//
//  ViewController.swift
//  Demo
//
//  Created by Дмитрий Поляков on 03.10.2022.
//

import UIKit
import DPLogger

class ViewController: UIViewController, DPLoggable {
    
    var isDPLoggingEnabled: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a: Int = 1
        let b: String = "b"
        let c: String? = nil
        let errorNotNil: Error = NSError(domain: "Example error", code: 1, userInfo: ["userInfo": a])
        let errorNil: Error? = nil
        
        self.log("a: \(a)", "b: \(b)", "c: \(c?.debugDescription ?? "nil")")
        
        self.log(parameters:
            .init(l: "a", v: a),
            .init(l: "b", v: b),
            .init(l: "c", v: nil)
        )
        
        self.log(error: errorNotNil)
        self.log(error: errorNil)
    }

}

