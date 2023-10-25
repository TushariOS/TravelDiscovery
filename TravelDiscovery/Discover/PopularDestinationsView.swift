//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 05/06/23.
//

import SwiftUI

//MARK:- PopularDestinationsView
struct PopularDestinationsView: View {
    let destinations: [Destination] = [.init(name: "Paris", country: "France", imageName: "1", latitude: 48.859565, longitude: 2.35235),
                                       .init(name: "Tokyo", country: "Japan", imageName: "2",  latitude: 35.679693, longitude: 139.771913),
                                       .init(name: "New York", country: "US", imageName: "3",  latitude: 40.71592, longitude: -74.0055)]
    var body: some View {
        VStack {
            HStack {
                Text("Popular Destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See All")
                    .font(.system(size: 12, weight: .semibold))
            } .padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(destinations, id: \.self) { item in
                        NavigationLink(destination: {
                            NavigationLazyView(PopularDestinationDetailsView(destination: item))},
                                       label: {
                            PopularDestinationTile(destination: item)
                                .padding(.bottom)
                        })
                    }
                }.padding(.horizontal)
            }
        }
    }
}



struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        //DiscoverView()
        PopularDestinationsView()
    }
}

struct PopularDestinationTile: View {
    let destination: Destination
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(5)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)
            
            Text(destination.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(.gray)
        }
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: .init(.sRGB, white: 0.9, opacity: 1), radius: 4, x: 0.0, y: 2.0)
        .padding(.bottom)
    }
}
