//
//  CountryDetailView.swift
//  MyTimeOn
//
//  Created by Alessandra Souza da Silva on 28/03/25.
//


import SwiftUI

/// View showing country details like image, time zone, and history.
struct CountryDetailView: View {
    let country: Country

    var body: some View {
        VStack(spacing: 16) {
            Image(country.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(radius: 5)
                .accessibilityHidden(true)

            Text(country.utcOffsetString)
                .font(.headline)
                .padding(.top, 8)

            Text(country.description)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle(country.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}