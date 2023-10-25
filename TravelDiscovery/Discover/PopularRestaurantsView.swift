//
//  SwiftUIView.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 05/06/23.
//

import SwiftUI

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


struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
