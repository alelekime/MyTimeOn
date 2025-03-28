//
//  ContentView.swift
//  MyTimeOn
//
//  Created by Alessandra Souza da Silva on 28/03/25.
//

import SwiftUI

/// Main screen with picker, clock, and link to country details.
struct ContentView: View {
    @StateObject private var viewModel = ClockViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                Spacer()
                Text("World Clock")
                    .font(.title)
                    .bold()

                Picker("Select Country", selection: $viewModel.selectedCountry) {
                    ForEach(countries) { country in
                        Text(country.name).tag(country)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                ClockView(viewModel: viewModel)

                NavigationLink(destination: CountryDetailView(country: viewModel.selectedCountry)) {
                    Text("More about \(viewModel.selectedCountry.name)")
                        .font(.footnote)
                        .padding(8)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                }

                Spacer()
            }
            .padding()
        }
    }
}
