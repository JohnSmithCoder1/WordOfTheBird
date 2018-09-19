//
//  TagViewController.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 9/2/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class PinLocationViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    var location: CLLocation?
    var updatingLocation = false
    var lastLocationError: Error?
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var performingReverseGeocoding = false
    var lastGeocodingError: Error?
    var timer: Timer?
    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeTextLabel: UILabel!
    @IBOutlet weak var longitudeTextLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nearestAddressTextLabel: UILabel!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var getButton: UIButton!
    
    
    
    @IBAction func getLocation() {
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        if authStatus == .denied || authStatus == .restricted {
            showLocationServicesDeniedAlert()
            return
        }
        if updatingLocation {
            stopLocationManager()
        } else {
            location = nil
            lastLocationError = nil
            placemark = nil
            lastGeocodingError = nil
            startLocationManager()
        }
        updateLabels()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getButton.layer.cornerRadius = 4.5
        getButton.layer.shadowColor = UIColor.black.cgColor
        getButton.layer.shadowOffset = CGSize(width: 4.5, height: 4.5)
        getButton.layer.shadowRadius = 4.5
        getButton.layer.shadowOpacity = 0.75
        tagButton.layer.cornerRadius = 4.5
        tagButton.layer.shadowColor = UIColor.black.cgColor
        tagButton.layer.shadowOffset = CGSize(width: 4.5, height: 4.5)
        tagButton.layer.shadowRadius = 4.5
        tagButton.layer.shadowOpacity = 0.75
        updateLabels()
    }
    
    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TagLocation" {
            let controller = segue.destination as! PinDetailsViewController
            controller.coordinate = location!.coordinate
            controller.placemark = placemark
            controller.managedObjectContext = managedObjectContext
        }
    }

    func showLocationServicesDeniedAlert() {
        let alert = UIAlertController(title: "Location Services Disabled",
                                      message: "Please enable location services for Word of the Bird in Settings.",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func updateLabels() {
        if let location = location {
            latitudeLabel.text = String(format: "%.8f", location.coordinate.latitude)
            longitudeLabel.text = String(format: "%.8f", location.coordinate.longitude)
            latitudeTextLabel.isHidden = false
            longitudeTextLabel.isHidden = false
            nearestAddressTextLabel.isHidden = false
            addressLabel.isHidden = false
            tagButton.isHidden = false
//            messageLabel.text = ""
            addressLabel.text = ""
            if let placemark = placemark {
                addressLabel.text = string(from: placemark)
            } else if performingReverseGeocoding {
                addressLabel.text = "Searching for Address..."
            } else if lastGeocodingError != nil {
                addressLabel.text = "No Address Found"
            }
        } else {
            latitudeLabel.text = ""
            longitudeLabel.text = ""
            latitudeTextLabel.isHidden = true
            longitudeTextLabel.isHidden = true
            nearestAddressTextLabel.isHidden = true
            addressLabel.isHidden = true
            tagButton.isHidden = true
            let statusMessage: String
            if let error = lastLocationError as NSError? {
                if error.domain == kCLErrorDomain && error.code == CLError.denied.rawValue {
                    statusMessage = "Location Services disabled"
                } else {
                    statusMessage = "Error getting location"
                }
            } else if !CLLocationManager.locationServicesEnabled() {
                statusMessage = "Location Services disabled"
            } else if updatingLocation {
                statusMessage = "Searching..."
            } else {
                statusMessage = "Tap 'Get My Location' to start"
            }
            messageLabel.text = statusMessage
        }
        configureGetButton()
    }
    
    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            updatingLocation = true
            timer = Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(didTimeOut), userInfo: nil, repeats: false)
        }
    }
    
    func stopLocationManager() {
        if updatingLocation {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            updatingLocation = false
            if let timer = timer {
                timer.invalidate()
            }
        }
    }
    
    func string(from placemark: CLPlacemark) -> String {
        var line1 = ""
        line1.add(text: placemark.subThoroughfare)
        line1.add(text: placemark.thoroughfare, separatedBy: " ")
        
        var line2 = ""
        line2.add(text: placemark.locality)
        line2.add(text: placemark.administrativeArea, separatedBy: ", ")
        line2.add(text: placemark.postalCode, separatedBy: " ")
        
        line1.add(text: line2, separatedBy: "\n")
        return line1
    }
    
    @objc func didTimeOut() {
        print("*** Time out")
        if location == nil {
            stopLocationManager()
            lastLocationError = NSError(domain: "WordoftheBirdErrorDomain", code: 1, userInfo: nil)
            updateLabels()
        }
    }
    
    //MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError \(error)")
        
        if (error as NSError).code == CLError.locationUnknown.rawValue {
            return
        }
        lastLocationError = error
        stopLocationManager()
        updateLabels()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        print("didUpdateLocations \(newLocation)")
        
        if newLocation.timestamp.timeIntervalSinceNow < -5 {
            return
        }
        if newLocation.horizontalAccuracy < 0 {
            return
        }
        var distance = CLLocationDistance(Double.greatestFiniteMagnitude)
        if let location = location {
            distance = newLocation.distance(from: location)
        }
        if location == nil || location!.horizontalAccuracy > newLocation.horizontalAccuracy {
            lastLocationError = nil
            location = newLocation
            if newLocation.horizontalAccuracy <= locationManager.desiredAccuracy {
                print("*** We're done!")
                stopLocationManager()
                if distance > 0 {
                    performingReverseGeocoding = false
                }
            }
            updateLabels()
            if !performingReverseGeocoding {
                print("*** Going to geocode")
                
                performingReverseGeocoding = true
                
                geocoder.reverseGeocodeLocation(newLocation, completionHandler: {
                    placemarks, error in
                    self.lastGeocodingError = error
                    if error == nil, let p = placemarks, !p.isEmpty {
                        if self.placemark == nil {
                        }
                        self.placemark = p.last!
                    } else {
                        self.placemark = nil
                    }
                    
                    self.performingReverseGeocoding = false
                    self.updateLabels()
                })
            }
        } else if distance < 1 {
            let timeInterval = newLocation.timestamp.timeIntervalSince(location!.timestamp)
            if timeInterval > 10 {
                print("*** Force done!")
                stopLocationManager()
                updateLabels()
            }
        }
    }

    func configureGetButton() {
        let spinnerTag = 1000
        
        if updatingLocation {
            getButton.setTitle("Stop", for: .normal)
            
            if view.viewWithTag(spinnerTag) == nil {
                let spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
                spinner.center = messageLabel.center
                spinner.center.y = 140
                spinner.startAnimating()
                spinner.tag = spinnerTag
                view.addSubview(spinner)
            }
        } else {
            getButton.setTitle("Get My Location", for: .normal)
            
            if let spinner = view.viewWithTag(spinnerTag) {
                spinner.removeFromSuperview()
                messageLabel.text = ""
            }
        }
    }
}







