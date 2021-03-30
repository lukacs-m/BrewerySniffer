//
//  SearchBar.swift
//  BrewerieSniffer
//
//  Created by Martin Lukacs on 18/03/2021.
//

import SwiftUI

struct SearchBar: View {
    @Binding var query: String

    var body: some View {
        HStack {
            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                TextField("Please enter the name of a city", text: $query)
                    .keyboardType(.alphabet)
                    .foregroundColor(AppTheme.Colors.foreground)
            }
            .padding()
            .background(AppTheme.Colors.tertiary.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            if !query.isEmpty {
                Button(action: {
                    self.query = ""
                }) {
                    Text("Cancel")
                }.foregroundColor(AppTheme.Colors.foreground)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(query: .constant(""))
    }
}

