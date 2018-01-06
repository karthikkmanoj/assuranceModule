//
//  TodaysAppointmentViewController.swift
//  Table View Controller Medikoe
//
//  Created by doTZ on 06/01/18.
//  Copyright © 2018 doTZ. All rights reserved.
//

import UIKit
import RealmSwift

class TodaysAppointmentViewController: UITableViewController {
    
    var todaysAppointmentRealm : Results<TodaysAppointmentRealm>!
    
    var todaysAppointment = [TodaysAppointment]()
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 200
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let nibName = UINib(nibName: "TodaysAppointmentTableViewCell", bundle: nil)
        
        tableView.register(nibName, forCellReuseIdentifier: "todayAppointmentCell")
        
        todaysAppointmentRealm = RealmService.shared.realm.objects(TodaysAppointmentRealm.self).sorted(byKeyPath: "name", ascending: true)
        
        menuButton.target = self.revealViewController()
        
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        //self.revealViewController().rearViewRevealWidth = 250
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        NetworkingService.shared.getTodaysAppointment { (response) in
            
            if response.1 == true {
                
                self.todaysAppointment = response.0!.todaysAppointment
                
                self.loadTodaysAppointmentCache(self.todaysAppointment)
                
                
            }
            
            
        }
        
    }

    func loadTodaysAppointmentCache(_ todaysAppointment : [TodaysAppointment]) {
        
        let realm = RealmService.shared.realm
        
        RealmService.shared.deleteAll(realm.objects(TodaysAppointmentRealm.self))
        
        for todaysAppointment in todaysAppointment {
            
            RealmService.shared.create(TodaysAppointmentRealm(name: todaysAppointment.name, mobileNumber: todaysAppointment.mobileNumber, email: todaysAppointment.email, time: todaysAppointment.time, assuranceID: todaysAppointment.assuranceID, appointmentID: todaysAppointment.appointmentID, date: todaysAppointment.date, status: todaysAppointment.status))
            
            
        }
        
    }
 
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todaysAppointmentRealm.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todayAppointmentCell", for: indexPath) as!
        
            TodaysAppointmentTableViewCell
        
        cell.todaysAppointment = todaysAppointmentRealm[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.alpha = 0
        
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        
        cell.layer.transform = transform
        
        
        UIView.animate(withDuration: 1.0) { 
            
            cell.alpha = 1
            
            cell.layer.transform = CATransform3DIdentity
            
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.layer.transform = 
    }

}
