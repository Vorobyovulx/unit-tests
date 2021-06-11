//
//  MadNetworkUnit.swift
//  MadUnitExampleTests
//
//  Created by Mad Brains on 11.06.2021.
//

import XCTest
@testable import MadUnitExample

class MadNetworkUnit: XCTestCase {

    // Проверка реального HTTP запроса на таймаут
    func testExpectationSearch() {
        // GIVEN
        let didReceiveResponse = expectation(description: #function)
        let sut = FakeNetworkService(httpClient: RealHTTPClient())

        var result: Result<[Track], Error>?

        // WHEN
        sut.search("MAD") {
            result = $0
            didReceiveResponse.fulfill()
        }

        wait(for: [didReceiveResponse], timeout: 5)

        // THEN
        switch result {
        case let .success(data):
            print(data)
            XCTAssertNotNil(data)

        case .failure:
            XCTFail("Test failed")

        case .none:
            XCTFail("Test failed")
        }
    }
    
    // Проверка корректности HTTP запроса
    func testSearch() {
        // GIVEN
        let httpClient = MockHTTPClient()
        let sut = FakeNetworkService(httpClient: httpClient)

        // WHEN
        sut.search("A") { _ in }

        // THEN
        XCTAssertTrue(httpClient.executeCalled)
        XCTAssertEqual(httpClient.inputRequest, .search(term: "A"))
    }

    // Проверка обработки корректного запроса
    func testSearchSuccessResponse() throws {
        // GIVEN
        let expectedTracks = [Track(trackName: "A", artistName: "B")]
        let response = try JSONEncoder().encode(SearchMediaResponse(results: expectedTracks))

        let httpClient = MockHTTPClient()
        httpClient.result = .success(response)

        let sut = FakeNetworkService(httpClient: httpClient)

        var result: Result<[Track], Error>!

        // WHEN
        sut.search("A") { result = $0 }

        // THEN
        switch result {
        case let .success(data):
            XCTAssertEqual(data, expectedTracks)

        case .failure:
            XCTFail("Test failed")

        case .none:
            XCTFail("Test failed")
        }
    }

    // Проверка обработки ошибок
    func testSearchFailureResponse() {
        let sut = FakeNetworkServiceWithoutDependency()

        let result = sut.parse(data: nil, error: SomeError())

        switch result {
        case .success:
            XCTFail("Test is successcully")

        case let .failure(error):
            XCTAssertTrue(error is SomeError)
        }
    }

    struct SomeError: Error {}

}
