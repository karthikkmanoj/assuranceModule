//
//  TodaysPatientResponse.swift
//  Table View Controller Medikoe
//
//  Created by doTZ on 06/01/18.
//  Copyright © 2018 doTZ. All rights reserved.
//

import Foundation

struct TodaysAppointmentResponse {
    
    let todaysAppointment : [TodaysAppointment]
    
    init(JSON : JSONformat) throws {
        
        guard let results = JSON["appointments"] as? [JSONformat] else { throw NetworkingError.couldNotProccesJSON }
    
        let todaysAppointment = results.map { TodaysAppointment(JSON : $0) }.flatMap { $0 }
        
        self.todaysAppointment = todaysAppointment
        
    }
    
}
