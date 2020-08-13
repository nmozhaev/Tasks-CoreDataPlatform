//
//  AbstractRepository.swift
//  CoreDataPlatform
//
//  Created by Никита Можаев on 05.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation

protocol AbstractRepository {
    
    associatedtype T
    
    func query(with predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, completion: @escaping ((Result<[T], Error>) -> Void))
    func save(_ entity: T, completion: ((Result<Void, Error>) -> Void)?)
    func delete(_ entity: T, completion: ((Result<Void, Error>) -> Void)?)
    
}

extension AbstractRepository {
    
    func query(with predicate: NSPredicate?, completion: @escaping ((Result<[T], Error>) -> Void)) {
        query(with: predicate, sortDescriptors: nil, completion: completion)
    }
    
    func query(sortDescriptors: [NSSortDescriptor]?, completion: @escaping ((Result<[T], Error>) -> Void)) {
        query(with: nil, sortDescriptors: sortDescriptors, completion: completion)
    }
    
    func queryAll(completion: @escaping ((Result<[T], Error>) -> Void)) {
        query(with: nil, sortDescriptors: nil, completion: completion)
    }
    
    func save(_ entity: T) {
        save(entity, completion: nil)
    }
    
    func delete(_ entity: T) {
        delete(entity, completion: nil)
    }
    
}
