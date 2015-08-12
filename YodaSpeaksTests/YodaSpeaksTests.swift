//
//  YodaSpeaksTests.swift
//  YodaSpeaksTests
//
//  Created by Alex Casanova on 7/13/15.
//  Copyright (c) 2015 Alex Casanova. All rights reserved.
//

import UIKit
import XCTest
import YodaSpeaks

class YodaSpeaksTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSentencePreparationForGetRequest() {
        // This is an example of a functional test case.        
        var yoda = YodaAPI.Mashape
        var cleanedSentence = yoda.cleanSentence("money it costs to quote me. accept uber credits I do not.")
        XCTAssertEqual("money+it+costs+to+quote+me.+accept+uber+credits+I+do+not.", cleanedSentence!, "Pass")
       
    }
    
    func testOutputters(){
        var yoda = YodaAPI.Mashape
        var yodaPhrase = String("money it costs to quote me. accept uber credits I do not.")
        var outputter = YodaAPI.Outputter.Leet
        var formattedString = outputter.Format(yodaPhrase)
        XCTAssertEqual(formattedString,"mon3y it co$t$ to quot3 m3. @cc3pt ub3r cr3dit$ I do not.","Pass")

        outputter = YodaAPI.Outputter.Raw
        formattedString = outputter.Format(yodaPhrase)
        XCTAssertEqual(formattedString,yodaPhrase,"Pass")
    }
    
}
