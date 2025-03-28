//
//  ClockViewModel.swift
//  MyTimeOn
//
//  Created by Alessandra Souza da Silva on 28/03/25.
//

import Foundation
import SwiftUI

/// ViewModel responsible for managing the selected country and formatting time and date.
final class ClockViewModel: ObservableObject {
    @AppStorage("selectedCountryID") private var selectedCountryID: String?
    @Published var selectedCountry: Country = countries[0] {
        didSet {
            selectedCountryID = selectedCountry.id.uuidString
        }
    }

    init() {
        if let savedID = selectedCountryID,
           let uuid = UUID(uuidString: savedID),
           let restored = countries.first(where: { $0.id == uuid }) {
            selectedCountry = restored
        }
    }

    /// Formats time in 24h format for the selected country's time zone.
    func formattedTime(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = selectedCountry.timeZone
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: date)
    }

    /// Formats date in medium style for the selected country's time zone.
    func formattedDate(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = selectedCountry.timeZone
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
