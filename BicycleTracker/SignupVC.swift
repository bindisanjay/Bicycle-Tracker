//
//  SignupVC.swift
//  BicycleTracker
//
//  Created by Gundu,Naveen Kumar on 11/1/22.
//

import UIKit

class SignupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var passwordconfirm: UITextField!
    
    
    @IBAction func onSubmit(_ sender: UIButton) {
        
        if(self.password.text == self.passwordconfirm.text){
            let dict = ["username":self.username.text,"password":self.password.text]
            
            DatabaseHelper.shareInstance.save(object: dict as! [String : String])
            
            let prnt = "Successfully Signed Up"
            let alert = UIAlertController(title: prnt, message: "Well Done", preferredStyle: .alert)
            let rtlBTN = UIAlertAction(title: "Return to Login", style: .default){ (action) in
                self.performSegue(withIdentifier: "returntoLogin", sender: self)
                
            }
            alert.addAction(rtlBTN)

            self.present(alert, animated: true)
        }
        else
        {
            let alert = UIAlertController(title: "Re enter fields", message: "Password not matching", preferredStyle: .alert)
            let rtlBTN = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(rtlBTN)

            self.present(alert, animated: true)
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logintosetting" {
            
            let controller = segue.destination as! SettingsVC
            controller.name = self.username.text!
            }
        }
}
    
    

