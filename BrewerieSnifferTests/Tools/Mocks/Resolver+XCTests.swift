//
//  Resolver+XCTests.swift
//  BrewerieSnifferTests
//
//  Created by Martin Lukacs on 20/03/2021.
//

import XCTest
import Resolver

@testable import BrewerieSniffer

extension Resolver {
    
    static var test: Resolver!
    
    static func resetUnitTestRegistrations() {
        Resolver.test = Resolver(parent: .main)
        Resolver.root = .test
    }
}
