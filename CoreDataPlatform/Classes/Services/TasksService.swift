//
//  TasksService.swift
//  CoreDataPlatform
//
//  Created by Никита Можаев on 05.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation

import Domain

final class TasksService<Repository>: Domain.TasksService where Repository: AbstractRepository, Repository.T == Domain.Task {
    
    /// The abstract property to handle all local database manipulations.
    private let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    /// Method for retrieving all tasks by day.
    /// - Parameters:
    ///   - date: A parameter used in predicate to filter tasks.
    ///   - completion: A closure returning the result of fetching.
    /// - Description:
    /// This method will fetch all tasks filtered by the day taken from the date parameter. The parameter will be separated into two parts startOfDay and endOfDay to determine day interval.
    /// The completion closure will be called after receiving a successful or failure result.
    func tasks(by date: Date, completion: @escaping (Result<[Domain.Task], Error>) -> Void) {
        let predicate = NSPredicate(format: "date >= %@ && date < %@", date.startOfDay as NSDate, date.endOfDay as NSDate)
        repository.query(with: predicate, completion: completion)
    }
    
    /// Method to save the new task
    /// - Parameters:
    ///   - task: An entity to save
    ///   - completion: A closure returning the result of saving
    func save(_ task: Domain.Task, completion: ((Result<Void, Error>) -> Void)?) {
        repository.save(task, completion: completion)
    }
    
}
