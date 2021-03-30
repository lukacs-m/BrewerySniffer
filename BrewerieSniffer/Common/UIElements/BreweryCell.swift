//
//  BreweryCell.swift
//  BrewerieSniffer
//
//  Created by Martin Lukacs on 20/03/2021.
//

import SwiftUI

struct BreweryCell: View {
    var brewery: Brewery
    
    var body: some View {
        containerView
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(AppTheme.Colors.foreground, lineWidth: 1)
                    .shadow(color: AppTheme.Colors.foreground, radius: 5)
            )
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
        
    }
}

private extension BreweryCell {
    var containerView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(brewery.name)
                .fontWeight(.semibold)
            if !brewery.phone.isEmpty {
                phoneInfoView
            }
            adressInfoView
        }
    }
}

private extension BreweryCell {
    var phoneInfoView: some View {
        HStack {
            Image(systemName: "phone")
                .foregroundColor(AppTheme.Colors.accent)
            Text(brewery.phone)
                .fontWeight(.light)
            Spacer()
        }
    }
}

private extension BreweryCell {
    var adressInfoView: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
                .foregroundColor(AppTheme.Colors.accent)
            Text("\(brewery.street) - \(brewery.city)")
                .fontWeight(.light)
            Spacer()
        }
    }
}

struct BreweryCell_Previews: PreviewProvider {
    static var previews: some View {
        BreweryCell(brewery: MockFactory.breweryMock)
    }
}
