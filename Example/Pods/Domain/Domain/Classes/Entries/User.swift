//
//  User.swift
//  Domain
//
//  Created by Никита Можаев on 04.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation

public struct User: Identifiable, Hashable {
    
    public let id: UUID
    public let name: String
    
    public init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
    
}
