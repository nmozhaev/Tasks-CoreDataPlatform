//
//  TasksService.swift
//  Domain
//
//  Created by Никита Можаев on 05.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation

public protocol TasksService {
    
    func tasks(by date: Date, completion: @escaping (Result<[Task], Error>) -> Void)
    
    func save(_ task: Task, completion: ((Result<Void, Error>) -> Void)?)
    
}
