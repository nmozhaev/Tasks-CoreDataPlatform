//
//  TasksServiceTests.swift
//  CoreDataPlatform_Tests
//
//  Created by Никита Можаев on 11.08.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import CoreData

import Domain
import CoreDataPlatform

class TasksService: XCTestCase {
    
    private let serviceProvider: Domain.ServiceProvider = {
        let storeDescription = NSPersistentStoreDescription()
        storeDescription.type = NSInMemoryStoreType
        storeDescription.shouldAddStoreAsynchronously = false
        let coreDataStack = CoreDataStack(storeDescription: storeDescription)
        return ServiceProvider(coreDataStack: coreDataStack)
    }()
    
    func testCreateTask() {
        
        // given
        let task = Task(title: "Task title", text: "Task text", date: Date(), isFinished: false)
        let expect = expectation(description: "Task creation is successful")
        let service = serviceProvider.makeTasksService()
        var creationResult: Result<Void, Error>?
        
        // when
        service.save(task) { result in
            creationResult = result
            expect.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("\(#function) timeout with error: \(error)")
                return
            }
            guard let creationResult = creationResult else {
                XCTFail("\(#function) failed with error: No creationResult")
                return
            }
            switch creationResult {
            case .success:
                XCTAssert(true, "\(#function) successfully created task")
            case .failure(let error):
                XCTFail("\(#function) failed with error: \(error.localizedDescription)")
            }
        }
        
    }
    
    func testFetchTasks() {
        
        // given
        let task = Task(title: "Task title", text: "Task text", date: Date(), isFinished: false)
        let service = serviceProvider.makeTasksService()
        let expect = expectation(description: "Tasks fetching is successful")
        var fetchingResult: Result<[Task], Error>?
        
        // when
        service.save(task) { result in
            service.tasks(by: Date()) { result in
                fetchingResult = result
                expect.fulfill()
            }
        }
        
        // then
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("\(#function) timeout with error: \(error)")
                return
            }
            guard let fetchingResult = fetchingResult else {
                XCTFail("\(#function) failed with error: No creationResult")
                return
            }
            switch fetchingResult {
            case .success(let tasks):
                XCTAssertFalse(tasks.isEmpty)
                XCTAssertEqual(task, tasks.first)
            case .failure(let error):
                XCTFail("\(#function) failed with error: \(error.localizedDescription)")
            }
        }
        
    }
    
    
}
