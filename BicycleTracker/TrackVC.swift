//
//  ViewController.swift
//  BicycleTracker
//
//  Created by Bindi,Sanjay Raj Goud on 10/31/22.
//

import UIKit
import MapKit
import CoreLocation

class TrackVC: UIViewController {
    
    
    var counter = 0
    var timer = Timer()
    
    var name: String = ""

    @IBOutlet weak var MapView: MKMapView!
    
    
    @IBOutlet weak var SpeedLBL: UILabel!
    
    
    @IBOutlet weak var DistanceLBL: UILabel!
    

    
    @IBOutlet weak var TimeLBL: UILabel!
    
    
    
    @IBAction func startTimerButtonTapped(_ sender: Any) {
        
        timer.invalidate()
        
        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }
        
    @objc func timerAction() {
           counter += 1
           TimeLBL.text = "Time : \(counter)"
       }
    
    
    @IBAction func cancelTimerButtonTapped(_ sender: UIButton) {
        
        timer.invalidate()
            }
        
    
    
    @IBOutlet weak var welcomeNameTF: UILabel!
    
    
    @IBAction func saveData(_ sender: UIButton) {
        let dict = ["speed":self.SpeedLBL.text,"distance":self.DistanceLBL.text,"time":self.TimeLBL.text]
        //let dict = [self.SpeedLBL.text,self.DistanceLBL.text,self.TimeLBL.text]
        DatabaseHelp.shareInstance.save(object: dict as! [String : String])
        
        let alert = UIAlertController(title: "Successfully Added", message: "Check History Tab", preferredStyle: .alert)
        let rtlBTN = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(rtlBTN)
        
        
        self.present(alert, animated: true)
        
        
    }
    
    let locationManager = CLLocationManager()
      let regionInMeters: Double = 10000
      
      override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          self.name = LoginVC.name
          self.welcomeNameTF.text = "Welcome \(self.name)"
          checkLocationServices()

      }
      
      func setupLocationManager() {
              locationManager.delegate = self
              locationManager.desiredAccuracy = kCLLocationAccuracyBest
          }
          
          
          func centerViewOnUserLocation() {
              if let location = locationManager.location?.coordinate {
                  let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
                  MapView.setRegion(region, animated: true)
              }
          }
          
          
          func checkLocationServices() {
              if CLLocationManager.locationServicesEnabled() {
                  setupLocationManager()
                  checkLocationAuthorization()
              } else {
                  // Show alert letting the user know they have to turn this on.
                  print("Location not enabled")
              }
          }
          
          
          func checkLocationAuthorization() {
              switch CLLocationManager.authorizationStatus() {
              case .authorizedWhenInUse:
                  MapView.showsUserLocation = true
                  centerViewOnUserLocation()
                  locationManager.startUpdatingLocation()
                  break
              case .denied:
                  // Show alert instructing them how to turn on permissions
                  break
              case .notDetermined:
                  locationManager.requestWhenInUseAuthorization()
              case .restricted:
                  // Show an alert letting them know what's up
                  break
              case .authorizedAlways:
                  break
              
              }
          }
      }




      extension TrackVC: CLLocationManagerDelegate {
          
          func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
              guard let location = locations.last else { return }
              let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
              MapView.setRegion(region, animated: true)
            
              SpeedLBL.text = "Speed : \(location.speed) mph"
              DistanceLBL.text = "Altitude : \(location.altitude)"
              var speeds = [CLLocationSpeed]()
              speeds.append(contentsOf: locations.map{$0.speed})
              var avgSpeed: CLLocationSpeed {
                  return speeds.reduce(0,+)/Double(speeds.count) //the reduce returns the sum of the array, then dividing it by the count gives its average
              }
              //TimeLBL.text = "\(avgSpeed)"
          }
          
          
          func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
              checkLocationAuthorization()
          }
          
          
          
          

    }
    
    
    


