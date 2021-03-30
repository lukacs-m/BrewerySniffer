//
//  API+Mocks.swift
//  BrewerieSnifferTests
//
//  Created by Martin Lukacs on 20/03/2021.
//

import Combine
import Networking
@testable import BrewerieSniffer

class BreweryRepoEmptyMock: BreweryRepositoryContract {
    func breweries(for params: Params) -> AnyPublisher<[Brewery], Error> {
        Just([]).switchToAnyPublisher(with: Error.self)
    }
    
    func filterParams(for cityName: String, and filter: BreweryType) -> Params? {
        return ["by_city":"test"]
    }
}

class BreweryRepoMock: BreweryRepositoryContract {
    func breweries(for params: Params) -> AnyPublisher<[Brewery], Error> {
        Just([MockFactory.breweryMock]).switchToAnyPublisher(with: Error.self)
    }
    
    func filterParams(for cityName: String, and filter: BreweryType) -> Params? {
        return ["by_city":"test"]
    }
}

class BreweriRepoErrorMock: BreweryRepositoryContract {
    func breweries(for params: Params) -> AnyPublisher<[Brewery], Error> {
        return Future<[Brewery], Error> { promise in
            promise(.failure(DecodingError.self as! Error))
        }.eraseToAnyPublisher()
    }
    
    func filterParams(for cityName: String, and filter: BreweryType) -> Params? {
        return ["by_city":"test"]
    }
}
