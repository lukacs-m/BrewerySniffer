//
//  EmptySearchView.swift
//  BrewerieSniffer
//
//  Created by Martin Lukacs on 25/03/2021.
//

import SwiftUI

struct EmptySearchView: View {
    let message: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "magnifyingglass.circle")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(AppTheme.Colors.foreground.opacity(0.45))
                Spacer()
            }
            HStack {
                Spacer()
                Text(message)
                    .foregroundColor(AppTheme.Colors.foreground)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
        }
    }
}

struct EmptySearchView_Previews: PreviewProvider {
    static var previews: some View {
        EmptySearchView(message: "This is a test")
    }
}
