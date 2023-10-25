//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 03/06/23.
//

import SwiftUI

struct DiscoverView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(.systemOrange),
                                                           Color(.white)]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .ignoresSafeArea()
                Color(.init(white: 0.95, alpha: 1))
                    .offset(y: 300)
                ScrollView {
                    HStack {
                        Image(systemName:"magnifyingglass")
                        Text("Where do you want to go?")
                        Spacer()
                    }.font(.system(size: 14, weight: .semibold))
                       .foregroundColor(.white)
                       .padding()
                       .background(Color(.init(white: 1, alpha: 0.3)))
                       .cornerRadius(16)
                       .padding(16)
                    DiscoverCategoriesView()
                    VStack {
                        PopularDestinationsView()
                        PopularRestaurantsView()
                        TrendingCreatorView()
                    }.background(Color.white)
                        .cornerRadius(16.0)
                        .padding(.top, 32)
                }
            }
            .navigationTitle("Discover")
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
