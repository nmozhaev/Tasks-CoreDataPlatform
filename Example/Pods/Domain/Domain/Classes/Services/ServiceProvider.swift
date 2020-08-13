//
//  ServiceProvider.swift
//  Domain
//
//  Created by Никита Можаев on 11.08.2020.
//

import Foundation

public protocol ServiceProvider {
    
    func makeTasksService() -> TasksService
    
}
