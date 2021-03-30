//
//  Views+Extensions.swift
//  BrewerieSniffer
//
//  Created by Martin Lukacs on 19/03/2021.
//

import SwiftUI
import SwiftUICombineToolBox

extension View {
    @ViewBuilder func pageState(for state: PageState) -> some View {
        self.overlay(
            VStack {
                if state == .full {
                    EmptyView()
                } else if case .empty(let message) = state {
                    EmptySearchView(message: message)
                } else {
                    ProgressView("Loading...")
                        .foregroundColor(AppTheme.Colors.foreground)
                        .scaleEffect(1.5, anchor: .center)
                        .frame(width: 150, height: 150, alignment: .center)
                        .background(AppTheme.Colors.tertiary.opacity(0.40))
                        .progressViewStyle(CircularProgressViewStyle(tint: AppTheme.Colors.accent))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
            }
        )
    }
    
    @ViewBuilder func fullScreenBackground<BackgroundContent: View>(with background: BackgroundContent,
                                           and safeAreaRegions: SafeAreaRegions = .all) -> some View {
        ZStack {
            background.ignoresSafeArea(safeAreaRegions)
            self
        }
    }
}
