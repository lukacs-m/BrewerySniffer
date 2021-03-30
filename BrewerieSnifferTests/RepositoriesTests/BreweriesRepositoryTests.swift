//
//  BreweriesRepositoryTests.swift
//  BrewerieSnifferTests
//
//  Created by Martin Lukacs on 20/03/2021.
//

import XCTest
import Resolver

@testable import BrewerieSniffer

class BreweriesRepositoryTests: XCTestCase {
    

    override func setUpWithError() throws {
        Resolver.resetUnitTestRegistrations()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNoParamsReturned() throws {
        let sut = BreweryRepository()
        let params = sut.filterParams(for: "", and: .none)
        XCTAssertNil(params)
    }
    
    func testCityParamsReturned() throws {
        let sut = BreweryRepository()
        let params = sut.filterParams(for: "berlin", and: .none)
        XCTAssert(params?.keys.count == 1)
        XCTAssert(params?.keys.first == "by_city")
        XCTAssert(params?.values.first?.description == "berlin")
    }
    
    func testFilterParamsReturned() throws {
        let sut = BreweryRepository()
        let params = sut.filterParams(for: "", and: .brewpub)
        XCTAssert(params?.keys.count == 1)
        XCTAssert(params?.keys.first == "by_type")
        XCTAssert(params?.values.first?.description == "brewpub")
    }

    func testFilterAndCityParamsReturned() throws {
        let sut = BreweryRepository()
        let params = sut.filterParams(for: "new york", and: .brewpub)
        XCTAssert(params?.keys.count == 2)
    }
}
