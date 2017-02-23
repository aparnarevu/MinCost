//
//  MinCostCalcTests.swift
//  MinCostCalcTests
//
//  Created by Divya Tatavarthi on 2/22/17.
//  Copyright © 2017 Aparna Revu. All rights reserved.
//

import XCTest
@testable import MinCostCalc

class MinCostCalcTests: XCTestCase {
    var viewController:HomeViewController?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        _ = viewController?.view
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatViewLoads() {
        XCTAssertNotNil(viewController?.view, "ViewController should contain a view");
        

    }
    
    func testResultLabelConnection() {
        XCTAssertNotNil(viewController?.resultLabel, " resultLabel should be connected");
    }
    func testTitleLabelConnection() {
        XCTAssertNotNil(viewController?.titleLabel, " titleLabel should be connected");
    }

    func testSegmentButtonConnection() {
        XCTAssertNotNil(viewController?.segmentControl, " segmentControl should be connected");
    }
    func testGetLowCostIBAction() {
        let actions = viewController?.segmentControl?.actions(forTarget: viewController, forControlEvent: UIControlEvents.valueChanged)
        XCTAssertTrue((actions?.contains("getLowCost:"))!, "")
    }
    
    func testCostListArray() {
        
        let costList:[[Int]] = [[3,6,5,8,3],[4,1,9,4,7],[1,8,3,1,2],[2,2,9,3,8],[8,7,9,2,6],[6,4,5,6,4]]
        
        let list:[[Int]] = (viewController?.cost)!
        XCTAssertEqual(costList[0],list[0])
        XCTAssertEqual(costList[1],list[1])
        XCTAssertEqual(costList[2],list[2])
        XCTAssertEqual(costList[3],list[3])
        XCTAssertEqual(costList[4],list[4])
        XCTAssertEqual(costList[5],list[5])

    }
    
    func testFirstSegmentAction() {
        viewController?.segmentControl?.selectedSegmentIndex = 0
        viewController?.segmentControl?.sendActions(for: UIControlEvents.valueChanged)
        XCTAssertEqual(viewController?.resultLabel?.text, "16")
    }
    func testSecondSegmentAction() {
        viewController?.segmentControl?.selectedSegmentIndex = 1
        viewController?.segmentControl?.sendActions(for: UIControlEvents.valueChanged)
        
        let costList:[[Int]] = [[3,6,5,8,3],[4,1,9,4,7],[1,8,3,1,2],[2,2,9,3,1],[8,7,9,2,2],[6,4,5,6,3]]
        
        let list:[[Int]] = (viewController?.cost)!
        XCTAssertEqual(costList[0],list[0])
        XCTAssertEqual(costList[1],list[1])
        XCTAssertEqual(costList[2],list[2])
        XCTAssertEqual(costList[3],list[3])
        XCTAssertEqual(costList[4],list[4])
        XCTAssertEqual(costList[5],list[5])

        XCTAssertEqual(viewController?.resultLabel?.text, "14")
    }
    
    func testThirdSegmentAction() {
        viewController?.segmentControl?.selectedSegmentIndex = 2
        viewController?.segmentControl?.sendActions(for: UIControlEvents.valueChanged)
        
        let costList:[[Int]] = [[19,21,20],[10,23,12],[19,20,20],[10,19,11],[19,12,10]]
        
        let list:[[Int]] = (viewController?.cost)!
        XCTAssertEqual(costList[0],list[0])
        XCTAssertEqual(costList[1],list[1])
        XCTAssertEqual(costList[2],list[2])
        XCTAssertEqual(costList[3],list[3])
        XCTAssertEqual(costList[4],list[4])
        
        XCTAssertEqual(viewController?.resultLabel?.text, "70")
    }


    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
