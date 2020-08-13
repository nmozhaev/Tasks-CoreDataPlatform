//
//  Persistable.swift
//  CoreDataPlatform
//
//  Created by Никита Можаев on 04.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation
import CoreData

protocol Persistable: NSFetchRequestResult, DomainRepresentable {
    
    var id: UUID? { get }
    
    static func fetchRequest() -> NSFetchRequest<Self>
    
    static var primaryKey: String { get }
    
}
