//
//  SettingsVC.swift
//  BicycleTracker
//
//  Created by Gundu,Naveen Kumar on 11/2/22.
//

import UIKit

class SettingsVC: UIViewController {

    
    
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet weak var saveBTN: UIButton!
    
    
    var signup = [Signup]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameLBL.isEnabled = false
        self.saveBTN.isHidden = true
        //self.navigationItem.title = "My Album"
        // Do any additional setup after loading the view.
        self.name = LoginVC.name
        self.profileName.text = "\(self.name)'s Profile"
        self.usernameLBL.text = "\(self.name)"

    }
    
    var name: String = ""
    var pass: String = ""
   
    @IBOutlet weak var usernameLBL: UITextField!
    
    
    @IBAction func editBTN(_ sender: UIButton) {
        self.usernameLBL.isEnabled = true
        self.saveBTN.isHidden = false
    }
    
    @IBAction func saveBTNA(_ sender: UIButton) {
        
        self.usernameLBL.isEnabled = false
        self.profileName.text = "\(self.usernameLBL.text!)'s Profile"
        self.saveBTN.isHidden = true
        
        
        
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
