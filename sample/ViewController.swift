
//  ViewController.swift
//  sample
//
//  Created by Neeru Mehndiratta on 20/02/17.
//  Copyright © 2017 Neeru Mehndiratta. All rights reserved.
//

import UIKit

import CoreLocation
class ViewController: UIViewController ,CLLocationManagerDelegate{
    
    let userLocation = CLLocation(latitude: 52.23678, longitude: 13.55555)
    
        var longitude : UILabel = {
        let m = UILabel()
        m.layer.borderWidth = 2
        m.text  = "Longitude"
        m.isUserInteractionEnabled = true
        m.backgroundColor = .white
        return m
    }()
    
     var latitude : UILabel = {
        let m = UILabel()
        m.layer.borderWidth = 2
        m.text  = "Latitude"
        m.isUserInteractionEnabled = true
        m.backgroundColor = .white
        return m
    }()

    
    var userlongitude : UILabel = {
        let m = UILabel()
        m.layer.borderWidth = 2
        m.text  = "Entr Longitude: "
        m.isUserInteractionEnabled = true
        m.backgroundColor = .white
        return m
    }()
    
    var userlatitude : UILabel = {
        let m = UILabel()
        m.layer.borderWidth = 2
        m.text  = "Enter Latitude: "
        m.isUserInteractionEnabled = true
        m.backgroundColor = .white
        return m
    }()
    
    var enterlongitude : UITextField = {
        let m = UITextField()
        m.layer.borderWidth = 2
        m.placeholder  = "Enter Longitude: "
        m.isUserInteractionEnabled = true
        m.backgroundColor = .white
        return m
    }()
    
    var enterlatitude : UITextField = {
        let m = UITextField()
        m.layer.borderWidth = 2
        m.placeholder = "Enter latitude"
        m.isUserInteractionEnabled = true
        m.backgroundColor = .white
        return m
    }()
    
    lazy var check : UIButton = {
        let b = UIButton(type: .system)
        b.backgroundColor = .black
        b.setTitle("Check",for: .normal)
        b.tintColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize:24)
        b.layer.cornerRadius = 4
        b.layer.masksToBounds = true
        b.addTarget(self, action: #selector(checking), for: .touchUpInside)
        return b
        
    }()
    
    func checking() {
        
        let lat = enterlatitude.text
        let long = enterlongitude.text
        
        if (lat == latitude.text) {
            
            if(long == longitude.text){
            let alert = UIAlertController(title: "Attention", message: "Matched ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

            }
        }
        
        else {
            
            let alert = UIAlertController(title: "Attention", message: "Not Matched! ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }
        
    
    }

    

    
    var locationManager: CLLocationManager = {
     let v = CLLocationManager()
        return v
    
    }()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(longitude)
            view.addSubview(latitude)
            view.addSubview(userlatitude)
            view.addSubview(userlongitude)
            view.addSubview(enterlatitude)
            view.addSubview(enterlongitude)
            view.addSubview(check)
            
            view.backgroundColor = UIColor.lightGray
            latitude.anchorCenterSuperview()
            longitude.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
            latitude.heightAnchor.constraint(equalToConstant: 80).isActive = true
            latitude.widthAnchor.constraint(equalToConstant: 100).isActive = true
            
            longitude.anchorCenterYToSuperview(constant: 100)
            longitude.anchorCenterXToSuperview()
            longitude.heightAnchor.constraint(equalToConstant: 80).isActive = true
            longitude.widthAnchor.constraint(equalToConstant: 100).isActive = true
            
            userlatitude.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 40)
            
             enterlatitude.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 30, widthConstant: 150, heightConstant: 40)
             userlongitude.anchor(userlatitude.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 40)
             enterlongitude.anchor(enterlatitude.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 30, widthConstant: 150, heightConstant: 40)
           check.anchorCenterXToSuperview(constant: -20)
           check.anchorCenterYToSuperview(constant: -150)
            
            
                        // Ask for Authorisation from the User.
            self.locationManager.requestAlwaysAuthorization()
            
            // For use in foreground
            self.locationManager.requestWhenInUseAuthorization()
            
            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
                print("if done")
            }
            
            
            else {
                print("Location services are not enabled");
            }
        }
        // MARK: - CoreLocation Delegate Methods
        private func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
            locationManager.stopUpdatingLocation()
            if ((error) != nil) {
                print(error)
            }
        }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locationArray  = locations as NSArray
        let locationObj = locationArray.lastObject  as! CLLocation
        let coord = locationObj.coordinate
        print("inside_didupdate")
        longitude.text = ("\(coord.latitude)")
        latitude.text = ("\(coord.longitude)")
        print(coord.longitude)
        print(coord.latitude)
        
       
        
    }
}



