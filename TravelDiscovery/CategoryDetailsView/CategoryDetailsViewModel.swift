//
//  CategoryDetailsViewModel.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 16/06/23.
//

import Foundation

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places: [Place] = []
    @Published var errorMessage: String = ""
    init(name: String) {
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\((name).lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.asyncAfter(deadline: .now()) {
              
                
                guard let data = data else { return }
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                }
                catch {
                    print("Error", error)
                    self.errorMessage = error.localizedDescription
                }
                self.isLoading = false
            }
        }.resume()
    }
}
