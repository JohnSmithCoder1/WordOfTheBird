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
import Alamofire
import SwiftyJSON

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
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather"
    let appID = "63b1578537bf98519c346221f7f4efda"
    let weatherData = WeatherData()
    var weatherString = "No weather data"
    
    //MARK: - IBOutlets
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeTextLabel: UILabel!
    @IBOutlet weak var longitudeTextLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressTextLabel: UILabel!
    @IBOutlet weak var getLocationButton: UIButton!
    @IBOutlet weak var pinLocationButton: UIButton!
    
    //MARK: - IBActions
    @IBAction func getLocation() {
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            showLocationServicesDeniedAlert()
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
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttons = [getLocationButton, pinLocationButton]
        for button in buttons {
            button?.layer.cornerRadius = 4.5
            button?.layer.shadowColor = UIColor.black.cgColor
            button?.layer.shadowOffset = CGSize(width: 4.5, height: 4.5)
            button?.layer.shadowRadius = 4.5
            button?.layer.shadowOpacity = 0.75
        }
        updateLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        determineAuthorization()
    }
    
    func determineAuthorization() {
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        } else if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            showLocationServicesDeniedAlert()
        }
    }
    
    func showLocationServicesDeniedAlert() {
        let alert = UIAlertController(title: "Location Services Disabled",
                                      message: "Please enable location services for Word of the Bird in phone Settings.",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            updatingLocation = true
            timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(didTimeOut), userInfo: nil, repeats: false)
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
    
    @objc func didTimeOut() {
        if location == nil {
            stopLocationManager()
            lastLocationError = NSError(domain: "WordoftheBirdErrorDomain", code: 1, userInfo: nil)
            updateLabels()
        }
    }
    
    func updateLabels() {
        if let location = location {
            latitudeLabel.text = String(format: "%.8f", location.coordinate.latitude)
            longitudeLabel.text = String(format: "%.8f", location.coordinate.longitude)
            addressTextLabel.isHidden = false
            latitudeTextLabel.isHidden = false
            longitudeTextLabel.isHidden = false
            pinLocationButton.isHidden = false
            messageLabel.text = ""
            if let placemark = placemark {
                addressLabel.text = string(from: placemark)
            } else if performingReverseGeocoding {
                addressLabel.text = "Searching for Address..."
            } else if lastGeocodingError != nil {
                addressLabel.text = "Error Finding Address"
            } else {
                addressLabel.text = "No Address Found"
            }
        } else {
            latitudeLabel.text = ""
            longitudeLabel.text = ""
            latitudeTextLabel.isHidden = true
            longitudeTextLabel.isHidden = true
            addressLabel.text = "Tap the button below to get the nearest address and location details!"
            addressTextLabel.isHidden = true
            pinLocationButton.isHidden = true
            
            let statusMessage: String
            if lastLocationError as NSError? != nil {
                statusMessage = "Error Getting Location"
            } else if updatingLocation {
                statusMessage = "Searching..."
            } else {
                statusMessage = ""
            }
            messageLabel.text = statusMessage
        }
        configureGetButton()
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
    
    func configureGetButton() {
        let spinnerTag = 1000
        
        if updatingLocation {
            addressLabel.text = ""
            messageLabel.text = "Calculating nearest location..."
            getLocationButton.setTitle("Stop", for: .normal)
            
            if view.viewWithTag(spinnerTag) == nil {
                let spinner = UIActivityIndicatorView(style: .large)
                spinner.center = messageLabel.center
                spinner.center.y = messageLabel.center.y + 40
                spinner.startAnimating()
                spinner.tag = spinnerTag
                view.addSubview(spinner)
            }
        } else {
            getLocationButton.setTitle("Get Location", for: .normal)
            
            if let spinner = view.viewWithTag(spinnerTag) {
                spinner.removeFromSuperview()
            }
        }
    }
    
    //MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if (error as NSError).code == CLError.locationUnknown.rawValue {
            return
        }
        lastLocationError = error
        stopLocationManager()
        updateLabels()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        
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
                stopLocationManager()
                if distance > 0 {
                    performingReverseGeocoding = false
                }
            }
            updateLabels()
            if !performingReverseGeocoding {
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
                stopLocationManager()
                updateLabels()
            }
        }
        
        if let location = location {
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            let parameters = ["lat": latitude, "lon": longitude, "appid": appID]
            
            getWeatherData(url: weatherURL, parameters: parameters)
        }
    }
    
    //MARK: - Networking
    func getWeatherData(url: String, parameters: [String: String]) {
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
          if case .success(let value) = response.result {
                print("Success! Got the weather data.")
              let weatherJSON = JSON(value)
                self.updateWeatherData(json: weatherJSON)
            } else {
              print("Error: \(response.error!)")
            }
        }
    }
    
    //MARK: - JSON Parsing
    func updateWeatherData(json: JSON) {
        let tempResult = json["main"]["temp"].doubleValue
        weatherData.temperature = Int(9/5 * (tempResult - 273) + 32)
        weatherData.condition = json["weather"][0]["description"].stringValue
        weatherString = String(weatherData.temperature) + "° " + weatherData.condition
        print(json)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TagLocation" {
            let controller = segue.destination as! PinDetailsViewController
            controller.coordinate = location!.coordinate
            controller.placemark = placemark
            controller.weatherString = weatherString
            controller.managedObjectContext = managedObjectContext
        }
    }
}
