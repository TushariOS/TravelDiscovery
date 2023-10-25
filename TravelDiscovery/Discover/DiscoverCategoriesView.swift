//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 05/06/23.
//

import SwiftUI

//MARK:- DiscoverCategoriesView
struct DiscoverCategoriesView: View {
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sports", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "music.mic"),
        .init(name: "History", imageName: "music.mic")]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 8) {
                ForEach(categories, id : \.self) { item in
                    NavigationLink (
                        destination: NavigationLazyView(CategoryDetailsView(name: item.name)),
                        label: {
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
                        }.frame(width: 68)
                    })
                    
                }
            }.padding(.horizontal)
        }
    }
}


struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView() {
//            CategoryDetailsView(name: "Art")
//        }
        DiscoverCategoriesView()
    }
}
