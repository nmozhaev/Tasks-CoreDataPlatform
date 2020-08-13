//
//  Task+CoreDataProperties.swift
//  CoreDataPlatform
//
//  Created by Никита Можаев on 04.08.2020.
//  Copyright © 2020 OneCompany. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var isFinished: Bool
    @NSManaged public var text: String?
    @NSManaged public var title: String?
    @NSManaged public var users: NSOrderedSet?

}

// MARK: Generated accessors for users
extension Task {

    @objc(insertObject:inUsersAtIndex:)
    @NSManaged func insertIntoUsers(_ value: User, at idx: Int)

    @objc(removeObjectFromUsersAtIndex:)
    @NSManaged func removeFromUsers(at idx: Int)

    @objc(insertUsers:atIndexes:)
    @NSManaged func insertIntoUsers(_ values: [User], at indexes: NSIndexSet)

    @objc(removeUsersAtIndexes:)
    @NSManaged func removeFromUsers(at indexes: NSIndexSet)

    @objc(replaceObjectInUsersAtIndex:withObject:)
    @NSManaged func replaceUsers(at idx: Int, with value: User)

    @objc(replaceUsersAtIndexes:withUsers:)
    @NSManaged func replaceUsers(at indexes: NSIndexSet, with values: [User])

    @objc(addUsersObject:)
    @NSManaged func addToUsers(_ value: User)

    @objc(removeUsersObject:)
    @NSManaged func removeFromUsers(_ value: User)

    @objc(addUsers:)
    @NSManaged func addToUsers(_ values: NSOrderedSet)

    @objc(removeUsers:)
    @NSManaged func removeFromUsers(_ values: NSOrderedSet)

}
