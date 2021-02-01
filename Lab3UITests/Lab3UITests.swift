//
//  Lab1UITests.swift
//  Lab1UITests
//
//  Created by ICS 224 on 2021-01-11.
//

import XCTest

class Lab3UITests: XCTestCase {

    override func setUpWithError() throws {
        
        XCUIApplication().launch()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        // To test the Simulator with a basic "1" and "0" then pressing the button one
        let app = XCUIApplication()
        
        
        app.switches["ToggleSwitch"].tap()
        app.textFields["Number of Pushes"].tap()
        
        let moreKey = app.keyboards.children(matching: .other).element.children(matching: .other).element/*@START_MENU_TOKEN@*/.children(matching: .key).matching(identifier: "more").element(boundBy: 0)/*[[".children(matching: .key).matching(identifier: \"numbers\").element(boundBy: 0)",".children(matching: .key).matching(identifier: \"more\").element(boundBy: 0)"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
       
        
        let key = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
     
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["0"]/*[[".keyboards.keys[\"0\"]",".keys[\"0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
   
        app.buttons["Push"].tap()
        
       
      
        XCTAssertEqual(app.staticTexts.firstMatch.label, "11")
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testletters() throws {
        // UI tests must launch the application that they test.
        // Testing letters by entering letters on keyboard, switching to number keyboard then entering numbers to show that letters will not be inputted in text field
        let app = XCUIApplication()
        
        
        app.switches["ToggleSwitch"].tap()
        app.textFields["Number of Pushes"].tap()
        
        let moreKey = app.keyboards.children(matching: .other).element.children(matching: .other).element/*@START_MENU_TOKEN@*/.children(matching: .key).matching(identifier: "more").element(boundBy: 0)/*[[".children(matching: .key).matching(identifier: \"numbers\").element(boundBy: 0)",".children(matching: .key).matching(identifier: \"more\").element(boundBy: 0)"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
       
        
        app.keys["A"].tap()
        app.keys["b"].tap()
        moreKey.tap()
        app.keys["4"].tap()
        app.keys["2"].tap()
        
     
       
   
        
        
       
      
        XCTAssertEqual(app.staticTexts.firstMatch.label, "42")
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testZeros() throws {
        // UI tests must launch the application that they test.
        //testing to make sure 0s do not get inputted before 1-9 numbers
        let app = XCUIApplication()
        
        
        app.switches["ToggleSwitch"].tap()
        app.textFields["Number of Pushes"].tap()
        
        let moreKey = app.keyboards.children(matching: .other).element.children(matching: .other).element/*@START_MENU_TOKEN@*/.children(matching: .key).matching(identifier: "more").element(boundBy: 0)/*[[".children(matching: .key).matching(identifier: \"numbers\").element(boundBy: 0)",".children(matching: .key).matching(identifier: \"more\").element(boundBy: 0)"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
       
        moreKey.tap()
        app.keys["0"].tap()
        app.keys["0"].tap()
        
        app.keys["7"].tap()
        app.keys["7"].tap()
        XCTAssertEqual(app.staticTexts.firstMatch.label, "77")
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testOverflow() throws {
        // UI tests must launch the application that they test.
        // Testing Overflow by entering large number with keyboard then pushing to make sure the text field goes back to zero
        
        let app = XCUIApplication()
        
        
        app.switches["ToggleSwitch"].tap()
        app.textFields["Number of Pushes"].tap()
        
        let moreKey = app.keyboards.children(matching: .other).element.children(matching: .other).element/*@START_MENU_TOKEN@*/.children(matching: .key).matching(identifier: "more").element(boundBy: 0)/*[[".children(matching: .key).matching(identifier: \"numbers\").element(boundBy: 0)",".children(matching: .key).matching(identifier: \"more\").element(boundBy: 0)"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
       //9223372036854775807
        moreKey.tap()
        app.typeText("9223372036854775807")
        
        app.buttons["Push"].tap()
        
        XCTAssertEqual(app.staticTexts.firstMatch.label, "0")
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}

