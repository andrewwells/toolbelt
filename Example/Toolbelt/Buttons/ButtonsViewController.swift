//
//  ButtonsViewController.swift
//  Toolbelt_Example
//
//  Created by Andrew Wells on 8/25/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import ToolbeltUI
import Toolbelt
import Hue

class BaseViewController: UIViewController { }

class ButtonsViewController: BaseViewController {
    
    private lazy var button: BaseButton = {
        let button = BaseButton()
        button.cornerRadius = 4
        button.textLabel.text = "Button"
        button.onTap = {
            Log.d("Button tapped!")
        }
        return button
    }()
    
    private lazy var roundButton: RoundButton = {
        let button = RoundButton()
        button.textLabel.text = "1"
        //button.labelPadding = 0
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationItem.title = "Buttons"
        self.view.backgroundColor = .white
        
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(20)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(roundButton)
        roundButton.snp.makeConstraints { (make) in
            make.top.equalTo(button.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
}
