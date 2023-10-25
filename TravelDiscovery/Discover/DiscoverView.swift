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
                LinearGradient(gradient: Gradient(colors: [Color(.systemOrange), Color(.white)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                Color(.init(white: 0.95, alpha: 1))
                    .offset(y: 300)
                ScrollView {
                    HStack {
                        Image("magnifyingglass")
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

struct Creatore: Hashable {
    let imageName: String
    let name: String
}

//MARK: - TrendingCreatorView
struct TrendingCreatorView: View {
    let creatores: [Creatore] = [.init(imageName: "6", name: "Billy"),
                                 .init(imageName: "7", name: "Anny"),
                                 .init(imageName: "8", name: "Grill"),
                                 .init(imageName: "6", name: "Sam"),
                                 .init(imageName: "7", name: "Dan"),
                                 .init(imageName: "8", name: "Jack")]
    var body: some View {
        VStack {
            HStack {
                Text("Trending Creator")
                    .font(.system(size: 12, weight: .semibold))
                Spacer()
                Text("See All")
                    .font(.system(size: 12, weight: .semibold))
            } .padding(.horizontal)
                .padding(.top)
        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack( alignment: .top, spacing: 8) {
                ForEach(creatores, id: \.self) { item in
                    VStack {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .cornerRadius(.infinity)
                        Text(item.name)
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                    .shadow(color: .init(.sRGB, white: 0.9, opacity: 1), radius: 4, x: 0.0, y: 2.0)

                    .padding(.bottom)
                }
            }.padding(.top, 5)
                .padding(.horizontal)
        }
    }
}

struct Restaurants: Hashable {
    let name, imageName: String
}
//MARK: - PopularRestaurantsView
struct PopularRestaurantsView: View {
    let restaurants: [Restaurants] = [.init(name: "Japan's Finest Tapas", imageName: "4"),
                                       .init(name: "Bar $ Grill", imageName: "5")]
    var body: some View {
        VStack {
            HStack {
                Text("Popular places to eat")
                    .font(.system(size: 12, weight: .semibold))
                Spacer()
                Text("See All")
                    .font(.system(size: 12, weight: .semibold))
            } .padding(.horizontal)
                .padding(.top)
        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8.0) {
                ForEach(restaurants, id: \.self) { item in
                    HStack(spacing: 8) {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .clipped()
                            .cornerRadius(5)
                            .padding(.leading, 6)
                            .padding(.vertical, 6)
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(item.name)
                                Spacer()
                                Button(action: {}, label: {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.gray)
                                }).padding(.trailing, 10)
                            }
                            HStack {
                                Image(systemName: "star.fill")
                                Text("4.4 • Sushi • $$")
                            }
                            Text("Tokyo, Japan")
                        }
                        .font(.system(size: 12, weight: .semibold))
                    }
                    .frame(width: 240)
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: .init(.sRGB, white: 0.9, opacity: 1), radius: 4, x: 0.0, y: 2.0)

                }
            }.padding(.top, 5)
                .padding(.horizontal)
        }
    }
}

struct Desination: Hashable {
    let name, country, imageName: String
}

//MARK:- PopularDestinationsView
struct PopularDestinationsView: View {
    let destinations: [Desination] = [.init(name: "Paris", country: "France", imageName: "1"),
                                      .init(name: "Tokyo", country: "Japan", imageName: "2"),
                                      .init(name: "New York", country: "US", imageName: "3")]
    var body: some View {
        VStack {
            HStack {
                Text("Popular Destinations")
                    .font(.system(size: 12, weight: .semibold))
                Spacer()
                Text("See All")
                    .font(.system(size: 12, weight: .semibold))
            } .padding(.horizontal)
                .padding(.top)
        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(destinations, id: \.self) { item in
                    VStack(alignment: .leading, spacing: 0) {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .cornerRadius(5)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 6)
                        Text(item.name)
                            .font(.system(size: 12, weight: .semibold))
                            .padding(.horizontal, 12)
                        Text(item.country)
                            .font(.system(size: 12, weight: .semibold))
                            .padding(.horizontal, 12)
                            .foregroundColor(.gray)
                    }
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: .init(.sRGB, white: 0.9, opacity: 1), radius: 4, x: 0.0, y: 2.0)
                    .padding(.bottom)
                }
            }.padding(.top, 5)
                .padding(.horizontal)
        }
    }
}


struct Category: Hashable {
    let name: String
    let imageName: String
}

//MARK:- DiscoverCategoriesView
struct DiscoverCategoriesView: View {
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "music.mic"),
        .init(name: "History", imageName: "music.mic")]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 8) {
                ForEach(categories, id : \.self) { item in
                    VStack(spacing: 4) {
                        Image(systemName: item.imageName)
                            .font(.system(size: 20))
                            .foregroundColor(Color(.systemOrange))
                            .frame(width: 64, height: 64)
                            .background(Color.white)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 0.0)
                        Text(item.name)
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                }.frame(width: 68)
            }
            .padding(5)
        }
    }
}
