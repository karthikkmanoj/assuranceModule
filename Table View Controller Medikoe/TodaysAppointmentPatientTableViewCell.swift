//
//  TodaysAppointmentPatientTableViewCell.swift
//  Table View Controller Medikoe
//
//  Created by doTZ on 06/01/18.
//  Copyright © 2018 doTZ. All rights reserved.
//

import UIKit
import RealmSwift

class TodaysAppointmentTableViewCell: UITableViewCell {
    
    var todaysAppointment : TodaysAppointmentRealm! {
        
        didSet {
            
            self.updateUI()
            
        }
        
    }
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var mobileNumber: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    
    func updateUI() {
        
        name.text = todaysAppointment.name
        
        mobileNumber.text = todaysAppointment.mobileNumber
        
        email.text = todaysAppointment.email
        
        time.text = todaysAppointment.time
        
        containerView.backgroundColor = UIColor.white
        
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        
        containerView.layer.cornerRadius = 3.0
        
        containerView.layer.masksToBounds = false
        
        containerView.layer.shadowColor =  UIColor.black.withAlphaComponent(0.2).cgColor
        
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        containerView.layer.shadowOpacity = 0.8
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
}
