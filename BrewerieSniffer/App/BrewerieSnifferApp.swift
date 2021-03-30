//
//  BrewerieSnifferApp.swift
//  BrewerieSniffer
//
//  Created by Martin Lukacs on 18/03/2021.
//

import SwiftUI
import SwiftUICombineToolBox

@main
struct BrewerieSnifferApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().embedInNavigation()
        }
    }
}
