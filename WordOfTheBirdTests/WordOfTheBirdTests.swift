//
//  WordOfTheBirdTests.swift
//  WordOfTheBirdTests
//
//  Created by Banana Viking on 12/11/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import XCTest
@testable import WordOfTheBird

class WordOfTheBirdTests: XCTestCase {

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
    
    func testNumberOfBirdsIs18() {
        let birdBank = BirdBank()
        
        XCTAssertTrue(birdBank.birds.count == 18)
    }
    
    func testLastBirdPropertiesAreTuftedTitmouses() {
        let birdBank = BirdBank()
        
        let bird = birdBank.birds.last
        
        XCTAssertEqual(bird?.name, "Tufted Titmouse")
        XCTAssertEqual(bird?.imageSmall, "tuftedTitmouseImageSmall")
        XCTAssertEqual(bird?.imageLarge, "tuftedTitmouseImageLarge")
        XCTAssertEqual(bird?.calls, ["tuftedTitmouseCall1"])
        XCTAssertEqual(bird?.infoLink, "https://en.wikipedia.org/wiki/Tufted_titmouse")
        XCTAssertEqual(bird?.mapLink, "https://upload.wikimedia.org/wikipedia/commons/3/39/Tufted_Titmouse-rangemap.gif")
    }
    
    func testPinLocationButtonStartsHidden() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pinLocationVC = storyboard.instantiateViewController(withIdentifier: "PinLocationViewController") as! PinLocationViewController
        pinLocationVC.loadViewIfNeeded()
        
        XCTAssertTrue(pinLocationVC.pinLocationButton.isHidden)
    }
    
    func testGetLocationButtonStartsShown() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pinLocationVC = storyboard.instantiateViewController(withIdentifier: "PinLocationViewController") as! PinLocationViewController
        pinLocationVC.loadViewIfNeeded()
        
        XCTAssertFalse(pinLocationVC.getLocationButton.isHidden)
    }
    
}
