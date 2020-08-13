//
//  Task.swift
//  Domain
//
//  Created by Никита Можаев on 04.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//

import Foundation

public struct Task: Identifiable, Hashable {
    
    public let id: UUID
    public let title: String
    public let text: String
    public let date: Date
    public let isFinished: Bool
    
    public init(id: UUID = UUID(), title: String, text: String, date: Date, isFinished: Bool) {
        self.id = id
        self.title = title
        self.text = text
        self.date = date
        self.isFinished = isFinished
    }
    
}
