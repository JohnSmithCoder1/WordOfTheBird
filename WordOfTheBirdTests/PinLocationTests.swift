//
//  PinLocationTests.swift
//  WordOfTheBirdTests
//
//  Created by Banana Viking on 12/11/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import XCTest
@testable import WordOfTheBird

class PinLocationTests: XCTestCase {

    var storyboard: UIStoryboard!
    var pinLocationVC: PinLocationViewController!
    
    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        pinLocationVC = storyboard.instantiateViewController(withIdentifier: "PinLocationViewController") as? PinLocationViewController
        pinLocationVC.loadViewIfNeeded()
    }

    override func tearDown() {
        storyboard = nil
        pinLocationVC = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetLocationButtonStartsShown() {
        XCTAssertFalse(pinLocationVC.getLocationButton.isHidden)
    }
    
    func testGetLocationButtonSaysGetLocationAtStart() {
        XCTAssertEqual(pinLocationVC.getLocationButton.titleLabel?.text, "Get Location")
    }
    
    func testGetLocationButtonSaysStopWhileUpdating() {
        pinLocationVC.updatingLocation = true
        pinLocationVC.configureGetButton()
        
        XCTAssertEqual(pinLocationVC.getLocationButton.titleLabel?.text, "Stop")
    }
    
    func testPinLocationButtonStartsHidden() {
        XCTAssertTrue(pinLocationVC.pinLocationButton.isHidden)
    }
    
    func testLatLongAddressLabelsStartHiddenOrEmpty() {
        XCTAssertTrue(pinLocationVC.latitudeTextLabel.isHidden)
        XCTAssertTrue(pinLocationVC.longitudeTextLabel.isHidden)
        XCTAssertTrue(pinLocationVC.addressTextLabel.isHidden)
        XCTAssertEqual(pinLocationVC.latitudeLabel.text, "")
        XCTAssertEqual(pinLocationVC.longitudeLabel.text, "")
        XCTAssertEqual(pinLocationVC.addressLabel.text, "")
    }
}
