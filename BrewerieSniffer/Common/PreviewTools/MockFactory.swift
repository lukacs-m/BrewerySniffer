//
//  MockFactory.swift
//  BrewerieSniffer
//
//  Created by Martin Lukacs on 20/03/2021.
//

enum MockFactory {
    static let breweryMock = Brewery(id: 817,
                                     breweryType: .large,
                                     name: "MillerCoors Brewing Co - Irwindale",
                                     street: "15801 1st St",
                                     city: "Irwindale",
                                     state: "California",
                                     postalCode: "91706-2069",
                                     country: "United States",
                                     longitude: nil,
                                     latitude: nil,
                                     phone: "6269696225",
                                     websiteURL: "http://www.millerbrewing.com",
                                     updatedAt: "2018-08-11T21:36:13.418Z",
                                     createdAt: "2018-07-24T01:32:58.294Z")
}
