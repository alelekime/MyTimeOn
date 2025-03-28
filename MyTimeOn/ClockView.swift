//
//  ClockView.swift
//  MyTimeOn
//
//  Created by Alessandra Souza da Silva on 28/03/25.
//


import SwiftUI

/// View that displays the live-updating time and date for the selected country.
struct ClockView: View {
    @ObservedObject var viewModel: ClockViewModel

    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { context in
            VStack(spacing: 12) {
                Text(viewModel.formattedTime(for: context.date))
                    .font(.system(size: 48, weight: .bold, design: .monospaced))
                    .accessibilityLabel("Current time")
                    .accessibilityValue(viewModel.formattedTime(for: context.date))

                Text(viewModel.formattedDate(for: context.date))
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .accessibilityLabel("Current date")
                    .accessibilityValue(viewModel.formattedDate(for: context.date))
            }
            .padding()
        }
    }
}
