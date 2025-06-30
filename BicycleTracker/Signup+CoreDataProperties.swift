//
//  Signup+CoreDataProperties.swift
//  BicycleTracker
//
//  Created by Gundu,Naveen Kumar on 11/1/22.
//
//

import Foundation
import CoreData


extension Signup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Signup> {
        return NSFetchRequest<Signup>(entityName: "Signup")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension Signup : Identifiable {

}
