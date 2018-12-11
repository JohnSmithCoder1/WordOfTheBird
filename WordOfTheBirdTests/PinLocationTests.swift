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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pinLocationVC = storyboard.instantiateViewController(withIdentifier: "PinLocationViewController") as! PinLocationViewController
        pinLocationVC.loadViewIfNeeded()
        
        XCTAssertFalse(pinLocationVC.getLocationButton.isHidden)
    }
    
    func testPinLocationButtonStartsHidden() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pinLocationVC = storyboard.instantiateViewController(withIdentifier: "PinLocationViewController") as! PinLocationViewController
        pinLocationVC.loadViewIfNeeded()
        
        XCTAssertTrue(pinLocationVC.pinLocationButton.isHidden)
    }
    
    func testPinLocationButtonShowsAfterUpdateLabels() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pinLocationVC = storyboard.instantiateViewController(withIdentifier: "PinLocationViewController") as! PinLocationViewController
        pinLocationVC.loadViewIfNeeded()
        
        pinLocationVC.updateLabels()
        pinLocationVC.loadView()
        
        XCTAssertFalse(pinLocationVC.pinLocationButton.isHidden)
    }
    
    func testGetLocationButtonSaysStopWhileUpdating() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pinLocationVC = storyboard.instantiateViewController(withIdentifier: "PinLocationViewController") as! PinLocationViewController
        pinLocationVC.loadViewIfNeeded()
        
        pinLocationVC.updatingLocation = true
        pinLocationVC.configureGetButton()
        
        XCTAssertEqual(pinLocationVC.getLocationButton.titleLabel?.text, "Stop")
    }

}
