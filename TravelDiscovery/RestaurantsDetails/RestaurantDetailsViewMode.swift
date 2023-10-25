//
//  RestaurantDetailsViewMode.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 19/06/23.
//

import Foundation

class RestaurantDetailsViewMode: ObservableObject {
    @Published var isLoading = true
    @Published var details: ResturantDetails?
    init() {
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=0"
        guard let  url = URL(string: urlString) else { return }
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.isLoading = false
                        do {
                            self.details = try? JSONDecoder().decode(ResturantDetails.self, from: data)
                        } catch {
                            print("error", error.localizedDescription)
                        }
                    }
                    
                }.resume()
    }
}

