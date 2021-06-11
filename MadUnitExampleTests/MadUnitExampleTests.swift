//
//  MadUnitExampleTests.swift
//  MadUnitExampleTests
//
//  Created by Mad Brains on 11.06.2021.
//

import XCTest
@testable import MadUnitExample

class MadUnitExampleTests: XCTestCase {

    var sut: MainViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MainViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    // wrong name!
    func someEmailValidatorTest1() throws {
        XCTAssert(sut.isValidEmail(email: "my.personal.address@google.co.uk") == true)
    }

    func testEmailValidatorTest() throws {
        XCTAssertTrue(sut.isValidEmail(email: "example@address.com"))
    }

    func testEmailValidatorTest3() throws {
        XCTAssertFalse(sut.isValidEmail(email: ""))
    }

    func testValidatorTest4() throws {
        XCTAssertEqual(sut.isValidEmail(email: "invalid@address."), false)
    }

    func testExample5() throws {
        XCTAssertNotEqual(sut.isValidEmail(email: "💩"), true)
    }

    func testPerformanceExample() throws {
        self.measure {
            let someArray = Array(0...10000)
            var counter = 0

            someArray.forEach {
                counter += $0
            }
        }
    }

}
