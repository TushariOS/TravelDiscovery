//
//  TrendingCreatorView.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 05/06/23.
//

import SwiftUI

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
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack( alignment: .top, spacing: 8) {
                    ForEach(creatores, id: \.self) { item in
                        NavigationLink(destination: UserDetailsView(user: item), label: {
                            DiscoverUserView(user: item)
                            .padding(.bottom)
                        })
                    }
                }.padding(.top, 5)
                    .padding(.horizontal)
            }
        }
    }
}

struct TrendingCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}

struct UserDetailsView: View {
    let user: Creatore

    var body: some View {
        ScrollView {
            Text("User Details")
        }.navigationBarTitle("UserName", displayMode: .inline)
    }
}

struct DiscoverUserView : View {
    let user: Creatore
    var body: some View {
        VStack {
            Image(user.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(.infinity)
            Text(user.name)
                .font(.system(size: 12, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.label))
        }
        .shadow(color: .init(.sRGB, white: 0.9, opacity: 1), radius: 4, x: 0.0, y: 2.0)
    }
}
