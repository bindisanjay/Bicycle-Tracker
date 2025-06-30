//
//  HistTVC.swift
//  BicycleTracker
//
//  Created by Gundu,Naveen Kumar on 12/1/22.
//

import UIKit
import CoreData

class HistTVC: UITableViewController, NSFetchedResultsControllerDelegate {
//
//    var track = [TrackTable]()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        track = DatabaseHelp.shareInstance.getTrackTableData()
//        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(showMenu(_:)))
//        self.tableView.addGestureRecognizer(longPressGesture)
//        // Do any additional setup after loading the view.
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
//    
//    var fetchedResultsController: NSFetchedResultsController<TrakTable>?
//    
//    private func fetchCars(){
//        let request: NSFetchRequest<TrakTable> = Car.fetchRequest()
//        request.sortDescriptors = [NSSortDescriptor(key: "model", ascending: true)]
//        
//        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: AppDelegate.viewContext, sectionNameKeyPath: nil, cacheName: nil)
//        fetchedResultsController?.delegate = self
//        try? fetchedResultsController?.performFetch()
//        self.tableView.reloadData()
//    }
//    
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        fetchedResultsController?.sections?.count ?? 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        fetchedResultsController?.sections?[section].numberOfObjects ?? 0
//    }
//
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "car", for: indexPath)
//        let cars = fetchedResultsController?.object(at: indexPath)
//        cell.textLabel?.text = String(format: "%@ %@ %@", String(cars!.year), cars!.make!, cars!.model!)
//        cell.detailTextLabel?.text = String(format: "$%@", String(cars!.price))
//        // Configure the cell...
//
//        return cell
//    }
//    
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // code
//    }
//    
//    
//    
//    
//    @objc func showMenu(_ recognizer: UILongPressGestureRecognizer)
//    {
//        switch recognizer.state
//        {
//        case .ended:
//            let point = recognizer.location(in: self.tableView)
//            if let idxPath = self.tableView.indexPathForRow(at: point)
//            {
//                let actionSheet = UIAlertController(title: "Edit", message: "Delete or Update", preferredStyle: .actionSheet)
//                actionSheet.addAction(UIAlertAction(title: "Delete", style: .destructive,handler: {[weak self] _ in
//                    let cars = self?.fetchedResultsController?.object(at: idxPath)
//                    AppDelegate.viewContext.delete(cars!)
//                    try? AppDelegate.viewContext.save()
//                }))
//
//                actionSheet.addAction(UIAlertAction(title: "Update", style: .default,handler: {[weak self] _ in
//                    let cars = self?.fetchedResultsController?.object(at: idxPath)
//                    let alert = UIAlertController(title: "Update", message: nil, preferredStyle: .alert)
//                    alert.addTextField{textField in
//                        textField.text = cars?.model
//                    }
//                    alert.addTextField{textField in
//                        textField.text = String(cars!.year)
//                    }
//                    alert.addTextField{textField in
//                        textField.text = cars?.make
//                    }
//                    alert.addTextField{textField in
//                        textField.text = String(cars!.price)
//                    }
//                    
//                   
//                    alert.addAction(UIAlertAction(title: "Submit", style: .default,handler: { _ in
//                        cars?.make = alert.textFields![0].text
//                        cars?.model = alert.textFields![1].text
//                        cars?.year = Int16(alert.textFields![2].text!)!
//                        cars?.price = Double(alert.textFields![3].text!)!
//
//                        try? AppDelegate.viewContext.save()
//                    }))
//
//                    self?.present(alert,animated:true)
//
//                }))
//                actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//                self.present(actionSheet,animated:true)
//
//
//            }
//        default:
//            break
//        }
//    }
//
//
//    /*
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
//    */
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */

}
