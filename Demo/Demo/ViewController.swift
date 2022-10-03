//
//  ViewController.swift
//  Demo
//
//  Created by Дмитрий Поляков on 03.10.2022.
//

import UIKit

class ViewController: UIViewController, DPLoggable {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
//        self.log(method: #function, "a: 1")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .yellow
        
        let a = 1
        let b = "b"
        self.log(method: #function, items: "a: \(a)", "b: \(b)")
        
        self.log(method: #function, parameters: .init(label: "a", value: a), .init(label: "b", value: b))
//        self.log(method: #function, "a: \(a)")
//        Self.log(method: #function, "a: \(a)")
//
        let error = NSError(domain: "Example error", code: 1, userInfo: ["userInfo": a])
        self.log(method: #function, error: error)
        self.log(method: #function, error: nil)
//        Self.logError(method: #function, error)
    }


}

