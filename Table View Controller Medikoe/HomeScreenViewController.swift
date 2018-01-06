//
//  HomeScreenViewController.swift
//  Table View Controller Medikoe
//
//  Created by doTZ on 05/01/18.
//  Copyright © 2018 doTZ. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        menuButton.target = self.revealViewController()
        
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        //self.revealViewController().rearViewRevealWidth = 250
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
