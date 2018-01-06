//
//  ToggleButtonCheckIn.swift
//  Table View Controller Medikoe
//
//  Created by doTZ on 06/01/18.
//  Copyright © 2018 doTZ. All rights reserved.
//

import Foundation
import UIKit

class ToggleButton : UIButton {
    
    var isOn = false
    
    override init(frame: CGRect) {
        
        super.init(frame : frame)
        
        initButton()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        initButton()
        
    }
    
    func initButton() {
        
        layer.borderWidth = 2.0
        
        layer.borderColor = UIColor.white.cgColor
        
        layer.cornerRadius = frame.size.height/2
        
        setTitleColor(UIColor.white, for: .normal)
        
        addTarget(self, action: #selector(ToggleButton.buttonPressed), for: .touchUpInside)
        
    }
    
    func buttonPressed() {
        
        activate(bool: !isOn)
        
    }
    
    func activate(bool : Bool) {
        
        isOn = bool
        
        let color = bool ? UIColor.green : UIColor.red
        
        let title = bool ? "Checked In" : "Missed"
        
        let titleColor = bool ? UIColor.white : UIColor.white
        
        setTitle(title, for: .normal)
        
        setTitleColor(titleColor, for: .normal)
        
        backgroundColor = color
        
        
    }
    
    
    
    
}
