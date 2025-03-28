//
//  Country.swift
//  MyTimeOn
//
//  Created by Alessandra Souza da Silva on 28/03/25.
//

import Foundation

/// Represents a country with metadata and time zone info.
struct Country: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let timeZoneID: String
    let description: String
    let imageName: String

    /// Returns a `TimeZone` object for the country.
    var timeZone: TimeZone? {
        TimeZone(identifier: timeZoneID)
    }

    /// Returns the UTC offset as a string like "UTC+3".
    var utcOffsetString: String {
        guard let timeZone = timeZone else { return "UTC" }
        let seconds = timeZone.secondsFromGMT()
        let hours = seconds / 3600
        return String(format: "UTC%+d", hours)
    }
}

/// List of supported countries.
let countries: [Country] = [
    Country(
        name: "🇧🇷 Brazil",
        timeZoneID: "America/Sao_Paulo",
        description: "Brazil is the largest country in South America, known for its rich culture, Amazon rainforest, and vibrant cities like São Paulo and Rio de Janeiro.",
        imageName: "brazil"
    ),
    Country(
        name: "🇮🇹 Italy",
        timeZoneID: "Europe/Rome",
        description: "Italy is a historic country in Southern Europe, famous for its Roman heritage, Renaissance art, and world-class cuisine.",
        imageName: "italy"
    ),
    Country(
        name: "🇯🇵 Japan",
        timeZoneID: "Asia/Tokyo",
        description: "Japan is an East Asian island nation known for its technology, traditions, and cities like Tokyo and Kyoto.",
        imageName: "japan"
    )
]
