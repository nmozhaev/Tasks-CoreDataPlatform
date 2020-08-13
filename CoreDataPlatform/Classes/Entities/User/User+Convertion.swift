//
//  User+Convertion.swift
//  CoreDataPlatform
//
//  Created by Никита Можаев on 04.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation

import Domain

extension User: Persistable {
    
    static var primaryKey: String { #keyPath(id) }
    
}

extension User: DomainRepresentable {
    
    func asDomain() throws -> Domain.User {
        guard let id = id, let name = name else { throw ConvertionError.notEnoughFields }
        return Domain.User(id: id, name: name)
    }
    
}

extension Domain.User: CoreDataRepresentable {
    
    func update(_ entity: User) {
        entity.id = id
        entity.name = name
    }
    
}
