//
//  CoreDataRepresentable.swift
//  CoreDataPlatform
//
//  Created by Никита Можаев on 04.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataRepresentable {
    
    associatedtype CoreDataType: Persistable
    
    var id: UUID { get }
    
    func update(_ entity: CoreDataType)
    
}
