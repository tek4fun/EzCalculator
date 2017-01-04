//
//  NumberButton.swift
//  EzCalculator
//
//  Created by iOS Student on 1/4/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class NumberButton: UIButton {

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
        if tag != 102 {
            if self.isHighlighted{
                backgroundColor = UIColor.init(red: 36/255, green: 54/255, blue: 111/255, alpha: 1)
            }
            backgroundColor = UIColor.init(red: 26/255, green: 71/255, blue: 222/255, alpha: 1)
        }
        layer.cornerRadius = 8.8
        
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.setTitleColor(UIColor.white, for: .normal)
    }


}
