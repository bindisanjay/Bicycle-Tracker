//
//  HistoryVC.swift
//  BicycleTracker
//
//  Created by Gundu,Naveen Kumar on 11/20/22.
//

import UIKit
import CoreData


class HistoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return track.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            track = DatabaseHelp.shareInstance.getTrackTableData()
            let trend = tableView.dequeueReusableCell(withIdentifier: "tableView", for: indexPath)
            
            trend.textLabel?.text = track[indexPath.row].speed
            trend.detailTextLabel?.text = String(format: "%@:     %@", track[indexPath.row].distance!, track[indexPath.row].time!)
            return trend
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            track = DatabaseHelp.shareInstance.deleteData(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //self.track[indexPath.row]
        }
        
    }

    

    @IBAction func deleteallBTN(_ sender: UIButton) {
       
       // let del = self.track.indexPathFor
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // code
    }
    
    
    var track = [TrackTable]()
    override func viewDidLoad() {
        super.viewDidLoad()
        track = DatabaseHelp.shareInstance.getTrackTableData()
        
//        tableView.delegate = self //error//
//        tableView.dataSource = self //error//
//        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(showMenu(_:)))
//        self.tableView.addGestureRecognizer(longPressGesture)
        // Do any additional setup after loading the view.
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
