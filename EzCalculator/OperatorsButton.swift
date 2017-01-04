//
//  OperatorsButton.swift
//  EzCalculator
//
//  Created by iOS Student on 1/4/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class OperatorsButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder:aDecoder)
        configureButton()
    }

    func configureButton()->Void{
        if tag == 101 {
            backgroundColor = UIColor.init(red: 245/255, green: 165/255, blue: 34/255, alpha: 1)
        } else {
            backgroundColor = UIColor.init(red: 116/255, green: 219/255, blue: 110/255, alpha: 1)
        }
        layer.cornerRadius = 8.8
        
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.setTitleColor(UIColor.white, for: .normal)
    }
}
