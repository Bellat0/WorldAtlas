//
//  NetworkManager.swift
//  WorldAtlas
//
//  Created by Maxim Tvilinev on 17.05.2023.
//

import Foundation

class NetworkManager {

    func fetchData(completion: @escaping (_ country: [Item]) -> ()) {
        let urlString = "https://restcountries.com/v3.1/all"
        guard let url = URL(string: urlString) else { return }

        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
            }
            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                let countryData = try decoder.decode([CountryData].self, from: data)
                let countries = countryData.compactMap {
                    Country(response: $0)
                }

                var continentWithCountry = [Continent: [Country]]()
                for country in countries {
                    if continentWithCountry[country.continents] != nil {
                        continentWithCountry[country.continents]?.append(country)
                    } else {
                        continentWithCountry[country.continents] = [country]
                    }
                }

                let item = continentWithCountry.sorted(
                    by:
                        { lhs, rhs in
                            lhs.key.rawValue < rhs.key.rawValue
                        })

                    .map { Item(country: $0.value, continent: $0.key) }
                completion(item)

            } catch let error {
                print(error)
            }
        }.resume()
    }
}
