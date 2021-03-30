//
//  API.swift
//  BrewerieSniffer
//
//  Created by Martin Lukacs on 19/03/2021.
//

import Networking

final class API: NetworkingService {

    var network = NetworkingClient(baseURL: APIConfig.baseUrl)
    
    init() {
        setUp()
    }
}

private extension API {
    func setUp() {
       
        #if DEBUG
        network.logLevels = .debug
        #else
        network.logLevels = .off
        #endif
    }
}
