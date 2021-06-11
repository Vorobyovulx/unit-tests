//
//  MadUnitAsync.swift
//  MadUnitExampleTests
//
//  Created by Mad Brains on 11.06.2021.
//

import XCTest
@testable import MadUnitExample

class MadUnitAsync: XCTestCase {

    var sut: MainViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MainViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testAsyncMethod() {
        // GIVEN
        let expectation = XCTestExpectation(description: "We should wait for the sample async method.")

        // WHEN
        sut.doSomethingAsync(
            delay: 2,
            completion: { [weak expectation] result in
                // THEN
                XCTAssertEqual(result, "Hello world!")
                expectation?.fulfill()
            }
        )

        self.wait(for: [expectation], timeout: 3)
    }

}
