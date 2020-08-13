//
//  DomainRepresentable.swift
//  CoreDataPlatform
//
//  Created by Никита Можаев on 04.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation

protocol DomainRepresentable {
    
    associatedtype DomainType

    func asDomain() throws -> DomainType
}
