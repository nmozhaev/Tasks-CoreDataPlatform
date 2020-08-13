//
//  Date+Ext.swift
//  CoreDataPlatform
//
//  Created by Никита Можаев on 10.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation

extension Date {
    
    var startOfDay: Date { Calendar.current.startOfDay(for: self) }
    
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
}
