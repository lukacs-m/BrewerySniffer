//
//  BreweriesRepository.swift
//  BrewerieSniffer
//
//  Created by Martin Lukacs on 19/03/2021.
//

import Combine
import Foundation
import Resolver
import Networking

protocol BreweryRepositoryContract {
    func breweries(for params: Params) -> AnyPublisher<[Brewery], Error>
    func filterParams(for cityName: String, and filter: BreweryType) -> Params?
}

final class BreweryRepository: BreweryRepositoryContract {
    @Injected private var api: BreweryAPIContract
    private let cache = Cache<String, [Brewery]>()
    
    init() {}
    
    func filterParams(for cityName: String, and filter: BreweryType) -> Params? {
        var params: Params?
        
        if filter != .none, !cityName.isEmpty {
            params = ["by_city": cityName, "by_type": filter.rawValue]
        } else if filter == .none, !cityName.isEmpty {
            params = ["by_city": cityName]
        } else if filter != .none, cityName.isEmpty {
            params = ["by_type": filter.rawValue]
        }
        return params
    }
    
    func breweries(for params: Params) -> AnyPublisher<[Brewery], Error> {
        let key = params.description
        if !key.isEmpty, let cachedBreweries = cache[key] {
            return Just(cachedBreweries)
                .switchToAnyPublisher(with: Error.self)
                .delay(for: 0.03, scheduler: RunLoop.main)
                .eraseToAnyPublisher()
        }
        return api.fetchBreweries(with: params)
            .map { [weak self] breweries in
                if !key.isEmpty {
                    self?.cache[key] = breweries
                }
                return breweries
            }.eraseToAnyPublisher()
    }
}
