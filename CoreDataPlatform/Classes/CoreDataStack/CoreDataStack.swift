//
//  CoreDataStack.swift
//  CoreDataPlatform
//
//  Created by Никита Можаев on 04.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataStack {
    
    private let modelName: String
    private let storeDescription: NSPersistentStoreDescription?
    
    lazy var managedContext: NSManagedObjectContext = { self.storeContainer.newBackgroundContext() }()
    
    private lazy var storeContainer: NSPersistentContainer = {
        let bundle = Bundle(for: CoreDataStack.self)
        guard let url = bundle.url(forResource: self.modelName, withExtension: "momd"),
            let model = NSManagedObjectModel(contentsOf: url) else {
                fatalError()
        }
        let container = NSPersistentContainer(name: self.modelName, managedObjectModel: model)
        if let storeDescription = self.storeDescription {
            container.persistentStoreDescriptions = [storeDescription]
        }
        container.loadPersistentStores {
            (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    public init(modelName: String = "Tasks", storeDescription: NSPersistentStoreDescription? = nil) {
        self.modelName = modelName
        self.storeDescription = storeDescription
        configure()
    }
    
    private func configure() {
        #if DEBUG
        guard storeContainer.persistentStoreDescriptions.filter({ $0.type == NSInMemoryStoreType }).isEmpty
            else { return }
        for entity in storeContainer.managedObjectModel.entities {
            guard let entityName = entity.name else { return }
            do {
                let query = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
                let deleteRequest = NSBatchDeleteRequest(fetchRequest: query)
                try managedContext.execute(deleteRequest)
                try managedContext.save()
            } catch let error as NSError {
                print("Error: \(error.localizedDescription)")
            }
        }
        #endif
    }
    
}
