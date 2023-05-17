//
//  CountryData.swift
//  WorldAtlas
//
//  Created by Maxim Tvilinev on 17.05.2023.
//

import Foundation

struct CountryData: Decodable {
    let continents: [Continent]
    let name: Name
    let flags: Flags
    let capital: [String]?
    let population: Int
    let area: Double
    let subregion: String?
    let capitalInfo: CapitalInfo
    let timezones: [String]
}


struct Country {
    var isExpanded: Bool = false
    let continents: Continent
    let name: Name
    let flags: Flags
    let capital: [String]?
    let population: Int
    let area: Double
    let subregion: String?
    let capitalInfo: CapitalInfo
    let timezones: [String]

    init(response: CountryData) {
        self.continents = response.continents.first ?? .europe
        self.name = response.name
        self.flags = response.flags
        self.capital = response.capital
        self.population = response.population
        self.area = response.area
        self.subregion = response.subregion
        self.capitalInfo = response.capitalInfo
        self.timezones = response.timezones
    }
}

struct Item {
    var country: [Country]
    let continent: Continent
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

struct Name: Codable {
    let common: String
}

struct Flags: Codable {
    let png: String
}

struct CapitalInfo: Codable {
    let latlng: [Double]?
}
