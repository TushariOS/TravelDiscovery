//
//  CategoryDetailsView.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 07/06/23.
//

import SwiftUI
import Kingfisher

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places: [Place] = []
    @Published var errorMessage: String = ""
    init(name: String) {
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\((name).lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.asyncAfter(deadline: .now()) {
               if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                   self.isLoading = false
                   self.errorMessage = "Bad Request \(statusCode)"
                   return
                }
                
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

struct CategoryDetailsView: View {
//    @State var isLoading = false
    private let name: String
    @ObservedObject private var viewModel: CategoryDetailsViewModel
    
    init(name: String) {
        self.name = name
        self.viewModel = .init(name: name)
    }
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                VStack {
                    ActivityIndicatiorView()
                    Text("Loading")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color.black)
                .cornerRadius(8)
            } else {
                ZStack {
                    if !viewModel.errorMessage.isEmpty {
                        VStack(spacing: 5) {
                        Image(systemName: "xmark.octagon.fill")
                                .font(.system(size: 64, weight: .semibold))
                                .foregroundColor(.red)
                            Text(viewModel.errorMessage)
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.red)
                        }//.foregroundColor(.brown)
                    } else {
                        ScrollView {
                            ForEach(viewModel.places, id: \.self) { item in
                                VStack(alignment: .leading, spacing: 0) {
                                    KFImage(URL(string: item.thumbnail)!)
                                        .resizable()
                                        .scaledToFill()
                                    Text(item.name)
                                        .font(.system(size: 12, weight: .semibold))
                                        .padding()
                                        .foregroundColor(.black)
                                }
                                .background(Color.white)
                                .cornerRadius(5)
                                .shadow(color: .init(.sRGB, white: 0.9, opacity: 1), radius: 4, x: 0.0, y: 2.0)
                                .padding()
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle(name, displayMode: .inline)
        .background(Color.white)
    }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsView(name: "Art")
    }
}
