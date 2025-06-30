//
//  DataBaseHelp.swift
//  BicycleTracker
//
//  Created by Gundu,Naveen Kumar on 11/20/22.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelp{
    
    
    static var shareInstance = DatabaseHelp()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object:[String:String]){
        let track = NSEntityDescription.insertNewObject(forEntityName: "TrackTable", into: context!) as! TrackTable
        track.speed = object["speed"]
        track.distance = object["distance"]
        track.time = object["time"]
        
        
        do{
            try context?.save()
        }catch{
            print("Data is not saved")
        }
    }
    
    func getTrackTableData() -> [TrackTable]{
        var track = [TrackTable]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TrackTable")
        
        do{
            track = try context?.fetch(fetchRequest) as! [TrackTable]
        }catch{
            print("Can't get data!")
        }
        
        return track
        
    }
    
    func deleteData(index:Int) -> [TrackTable]{
        var track = [TrackTable]()
        track = DatabaseHelp.shareInstance.getTrackTableData()
//        print("Hi!!!!!!!!!!!!!!!!!!!!!!!!!!")
//        print("\(track[index])")
//        print("Byeeeeeeeeeeeeeee")
        context?.delete(track[index])
        
        //context?.delete(track.append(index))
        track.remove(at: index)
        do{
            try context?.save()
        }catch{
            print("Cannot delete data")
        }
        return track
    }
    
}
