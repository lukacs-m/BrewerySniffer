//
//  BreweryAPI.swift
//  BrewerieSniffer
//
//  Created by Martin Lukacs on 19/03/2021.
//

import Combine
import Networking

protocol BreweryAPIContract {
    func fetchBreweries(with params: Params) -> AnyPublisher<[Brewery], Error>
}

extension API: BreweryAPIContract {
    
    // Read
    func fetchBreweries(with params: Params) -> AnyPublisher<[Brewery], Error> {
        return get("/", params: params)
    }
}

