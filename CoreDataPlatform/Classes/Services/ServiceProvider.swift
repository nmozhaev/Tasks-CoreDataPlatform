//
//  ServiceProvider.swift
//  CoreDataPlatform
//
//  Created by Никита Можаев on 05.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation

import Domain

public class ServiceProvider: Domain.ServiceProvider {
    
    /// Stack to configure intiial CoreData preferences
    private let coreDataStack: CoreDataStack
    
    /// Repository to manage tasks different manipulations
    private let tasksRepository: Repository<Domain.Task>
    
    public init(coreDataStack: CoreDataStack = CoreDataStack()) {
        self.coreDataStack = coreDataStack
        self.tasksRepository = Repository(context: coreDataStack.managedContext)
    }
    
    /// Method to create TasksService
    public func makeTasksService() -> Domain.TasksService { TasksService(repository: tasksRepository) }
    
}
