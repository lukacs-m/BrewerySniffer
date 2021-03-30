//
//  HomeViewModelTests.swift
//  BrewerieSnifferTests
//
//  Created by Martin Lukacs on 20/03/2021.
//

import XCTest
import Resolver
import Combine
import SwiftUICombineToolBox
import Networking
@testable import BrewerieSniffer

class HomeViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        Resolver.resetUnitTestRegistrations()
    }

    override func tearDownWithError() throws {
//        Resolver.root = .main
    }

    func testInitialState() throws {
        let sut = HomeViewModel()
        XCTAssert(sut.state == .empty("It's a bit empty here. Please go looking for a fresh beer"))
    }
    
    func testLoadingState() throws {
        let sut = HomeViewModel()
        let tokenPublisher = sut.$state.collectNext(1)

        sut.query = "Paris"
        let newState = try await(tokenPublisher)
        XCTAssertEqual(newState.count, 1)
        XCTAssert(newState.first == .loading)
    }
    
    func testEmptyState() throws {
        Resolver.test.register { BreweryRepoEmptyMock() as BreweryRepositoryContract }
        let sut = HomeViewModel()
        let statePublisher = sut.$state.collectNext(2)
        
        sut.query = "atlanta"
        let newState = try await(statePublisher)
        XCTAssertEqual(newState.count, 2)
        XCTAssert(newState.first == .loading)
        XCTAssert(newState.last == .empty("It's a bit empty here. Please go looking for a fresh beer"))
    }
    
    func testFullState() throws {
        Resolver.test.register { BreweryRepoMock() as BreweryRepositoryContract }
        let sut = HomeViewModel()
        let statePublisher = sut.$state.collectNext(2)
        let breweryPublisher = sut.$breweries.collectNext(1)
        
        sut.query = "new york"
        let newState = try await(statePublisher)
        sut.query = "berlin"
        let newBreweriesEvents = try await(breweryPublisher)
        
        XCTAssertEqual(newState.count, 2)
        XCTAssert(newState.first == .loading)
        XCTAssert(newState.last == .full)
        XCTAssert(newBreweriesEvents.count == 1)
        XCTAssert(newBreweriesEvents.first?.first?.name == MockFactory.breweryMock.name)
    }
}
