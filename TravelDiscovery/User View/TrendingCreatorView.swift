//
//  TrendingCreatorView.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 05/06/23.
//

import SwiftUI

//MARK: - TrendingCreatorView
struct TrendingCreatorView: View {
    let creatores: [Creatore] = [.init(id: 0, imageName: "6", name: "Billy"),
                                 .init(id: 1, imageName: "7", name: "Anny"),
                                 .init(id: 2, imageName: "8", name: "Grill"),
                                 .init(id: 3, imageName: "6", name: "Sam"),
                                 .init(id: 4, imageName: "7", name: "Dan"),
                                 .init(id: 5, imageName: "8", name: "Jack")]
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
        TrendingCreatorView()
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

    /*
     
      @ViewBuilder
         var productSuggestions: some View {
             LazyVGrid(columns: columns, spacing: 0) {
                 LoadingData(viewModel.productSuggestions, isLoadingManagedBySubviews: true) { _, product in
                     VStack(alignment: .leading, spacing: 8) {
                         Button {
                             
                             selectedSuggestion = product.name
                             viewModel.navigateToPDP(with: product)
                             
                         } label: {
                             HStack(alignment: .top, spacing: 27) {
                                 
                                 AsyncImage(
                                     url: product.imageUrl,
                                     content: { image in
                                         image
                                             .resizable()
                                         
                                     }, placeholder: {
                                         brand.images.placeholder
                                             .resizable()
                                             .aspectRatio(contentMode: .fit)
                                     })
                                 .frame(width: 45, height: 45)
                                 .cornerRadius(1)
                                 .animateLoading(for: product)
                                 
                                 Text(product.name)
                                     .font(brand.fonts.bodyMDRegularTight.font)
                                     .foregroundColor(brand.colors.primaryDark)
                                     .lineLimit(2)
                                     .animateLoading(for: product)
                                     .frame(height: 45)
                                     .multilineTextAlignment(.leading)
                                 
                                 Spacer()
                             }
                         }
                         .frame(maxWidth: .infinity)

                         Divider()
                     }
                     .frame(height: 64)
                 }
             }
             .padding(.bottom)
         }
     */
