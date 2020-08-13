//
//  NSManagedObjectContext+Ext.swift
//  CoreDataPlatform
//
//  Created by Никита Можаев on 05.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    func create<T: NSFetchRequestResult>() -> T {
        guard let entity = NSEntityDescription.insertNewObject(forEntityName: String(describing: T.self),
                into: self) as? T else {
            fatalError()
        }
        return entity
    }
}
