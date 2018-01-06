//
//  MenuOptionTableViewCell.swift
//  Table View Controller Medikoe
//
//  Created by doTZ on 05/01/18.
//  Copyright © 2018 doTZ. All rights reserved.
//

import UIKit

class MenuOptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var optionIcon : UIImageView!
    
    @IBOutlet weak var optionName : UILabel!
    
    @IBOutlet weak var containerView : UIView!
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(optionIcon : String, optionName : String) {
        
        self.optionIcon.image = UIImage(named: optionIcon)
        
        self.optionName.text = optionName
        
    }

 
}
