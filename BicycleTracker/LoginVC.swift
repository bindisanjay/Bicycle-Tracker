//
//  LoginVC.swift
//  BicycleTracker
//
//  Created by Bindi,Sanjay Raj Goud on 11/1/22.
//

import UIKit
import LocalAuthentication
import CoreLocation


class LoginVC: UIViewController {
    static var name:String=""
    static var pass:String=""
    
    var signup = [Signup]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.usernameTF.text)
        
        signup = DatabaseHelper.shareInstance.getSignupData()
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
    
    
    @IBOutlet weak var usernameTF: UITextField!
    
    
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func FaceID(_ sender: Any) {
        let context = LAContext()
        var Aerror : NSError?
        let reason = "Please authorize with touch id"
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &Aerror){
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){success , evaluateerror in
                if success{
                    print("success")
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "loginLink", sender: nil)
                    }
                }
                    else{
                        guard let error = evaluateerror else{
                            return
                        }
                        print(error)
                        
                    }
                }
            }
            else{
                guard let error = Aerror else{
                    return
                }
                print(error)
            }
        }

     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier{
            case "logintosettings":
                if let settingName = segue.destination as? SettingsVC{
                    
                    settingName.name = self.usernameTF.text!
                }
                
            case "logintotrack":
                if let trackName = segue.destination as? TrackVC{
                    
                    trackName.name = self.usernameTF.text!
                }
            default:
                break
            }
        }
    }
    
    
    
    
    
    @IBAction func login(_ sender: UIButton) {
        
        LoginVC.name =  usernameTF.text!
        
        
        for sign in signup{
            
            if(sign.username == self.usernameTF.text && sign.password == self.passwordTF.text){
                
                self.performSegue(withIdentifier: "loginLink", sender: self)
                

            }
            //                else if(sign.username != self.usernameTF.text && sign.password != self.passwordTF.text){
            //                    print("Nope")
            ////                    let alert = UIAlertController(title: "No record found", message: "Please enter the correct username and password", preferredStyle: .alert)
            ////                    let cancelBTN = UIAlertAction(title: "Ok", style: .default)
            ////                    alert.addAction(cancelBTN)
            ////
            ////                    self.present(alert, animated: true)
            //                }
        }
    }
    
    
    
}
