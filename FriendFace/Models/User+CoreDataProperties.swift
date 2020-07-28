//
//  User+CoreDataProperties.swift
//  FriendFace
//
//  Created by Nate Lee on 7/28/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var company: String?
    @NSManaged public var age: Int16
    @NSManaged public var friends: NSSet?
    
    var friendsArray: [Friend] {
        let set = friends as? Set<Friend> ?? []
        let sortedArray = set.sorted {
            $0.wrappedName < $1.wrappedName
        }
        
        var counter = 1
        sortedArray.forEach { (friend) in
            print("🤩 \(counter)")
            print(friend)
            counter += 1
        }
        
        return sortedArray
    }
    
}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}
