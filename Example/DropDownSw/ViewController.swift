//
//  ViewController.swift
//  DropDownSw
//
//  Created by motosw3600 on 08/10/2022.
//  Copyright (c) 2022 motosw3600. All rights reserved.
//

import UIKit
import DropDownSw

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDropDownSw()
    }
    
    private func setupDropDownSw() {
        let dropDown = DropDownSw()
        dropDown.delegate = self
        dropDown.addItem("one")
        dropDown.addItem("two")
        dropDown.addItem("three")
        view.addSubview(dropDown)
        
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        dropDown.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dropDown.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
}

extension ViewController: DropDownSwDelegate {
    func tapItem(index: Int) {
        print(index)
    }
}

