//
//  Repository.swift
//  CoreDataPlatform
//
//  Created by Никита Можаев on 04.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation
import CoreData

class Repository<T: CoreDataRepresentable>: AbstractRepository where T == T.CoreDataType.DomainType {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func query(with predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil, completion: @escaping (Result<[T], Error>) -> Void) {
        let request = T.CoreDataType.fetchRequest()
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        do {
            let entities = try context.fetch(request).map { try $0.asDomain() }
            completion(.success(entities))
        } catch {
            completion(.failure(error))
        }
    }
    
    func first(with predicate: NSPredicate, completion: @escaping (Result<T.CoreDataType?, Error>) -> Void) {
        let request = T.CoreDataType.fetchRequest()
        request.predicate = predicate
        do {
            let entity = try context.fetch(request).first
            completion(.success(entity))
        } catch {
            completion(.failure(error))
        }
    }
    
    func save(_ entity: T, completion: ((Result<Void, Error>) -> Void)?) {
        let predicate = predicateToFind(entity)
        first(with: predicate) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let foundEntity):
                do {
                    let entityToUpdate: T.CoreDataType = foundEntity ?? self.context.create()
                    entity.update(entityToUpdate)
                    try self.context.save()
                    completion?(.success(()))
                } catch {
                    completion?(.failure(error))
                }
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    func delete(_ entity: T, completion: ((Result<Void, Error>) -> Void)?) {
        let predicate = predicateToFind(entity)
        first(with: predicate) { [weak self] result in
            switch result {
            case .success(let entity):
                if let entity = entity as? NSManagedObject {
                    self?.context.delete(entity)
                }
                completion?(.success(()))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    private func predicateToFind(_ entity: T) -> NSPredicate {
        let left = NSExpression(forKeyPath: T.CoreDataType.primaryKey)
        let right = NSExpression(forConstantValue: entity.id)
        return NSComparisonPredicate(leftExpression: left, rightExpression: right, modifier: .direct, type: .equalTo)
    }
    
}
