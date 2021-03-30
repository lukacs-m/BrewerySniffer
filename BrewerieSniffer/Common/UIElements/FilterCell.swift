//
//  FilterCell.swift
//  BrewerieSniffer
//
//  Created by Martin Lukacs on 20/03/2021.
//

import SwiftUI

struct FilterCell: View {
    var title: String
    var isSelected: Bool
    
    var body: some View {
        Text(title.capitalized)
            .foregroundColor(isSelected ? AppTheme.Colors.accent : AppTheme.Colors.foreground)
        .fontWeight(.regular)
    }
}

struct FilterCell_Previews: PreviewProvider {
    static var previews: some View {
        FilterCell(title: "All", isSelected: true)
    }
}
