//
//  DatabaseHelper.swift
//  BicycleTracker
//
//  Created by Gundu,Naveen Kumar on 11/1/22.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    
    static var shareInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object:[String:String]){
        let signup = NSEntityDescription.insertNewObject(forEntityName: "Signup", into: context!) as! Signup
        signup.username = object["username"]
        signup.password = object["password"]
        
        
        do{
            try context?.save()
        }catch{
            print("Data is not saved")
        }
    }
    
    func getSignupData() -> [Signup]{
        var signup = [Signup]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Signup")
        
        do{
            signup = try context?.fetch(fetchRequest) as! [Signup]
        }catch{
            print("Can't get data!")
        }
        
        return signup
        
    }
    
}
