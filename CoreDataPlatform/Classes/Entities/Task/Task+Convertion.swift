//
//  Task+Convertion.swift
//  CoreDataPlatform
//
//  Created by Никита Можаев on 04.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation

import Domain

extension Task: Persistable {
    
    static var primaryKey: String { #keyPath(id) }
    
}

extension Task: DomainRepresentable {
    
    func asDomain() throws -> Domain.Task {
        guard let id = id,
            let title = title,
            let text = text,
            let date = date else {
                throw ConvertionError.notEnoughFields
        }
        return Domain.Task(id: id,
                           title: title,
                           text: text,
                           date: date,
                           isFinished: isFinished)
    }
    
}

extension Domain.Task: CoreDataRepresentable {
    
    func update(_ entity: Task) {
        entity.id = id
        entity.title = title
        entity.text = text
        entity.date = date
        entity.isFinished = isFinished
    }
    
}
