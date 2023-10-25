//
//  RestaurantDetailsView.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 19/06/23.
//

import SwiftUI
import Kingfisher

struct RestaurantDetailsView: View {
    @ObservedObject var viewModel = RestaurantDetailsViewMode()
    let restaurant: Restaurants
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                Image(restaurant.imageName)
                    .resizable()
                    .scaledToFill()
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                HStack {
                    VStack(alignment: .leading) {
                        Text(restaurant.name)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                        HStack {
                            ForEach(0..<5, id: \.self) { num in
                                Image(systemName: "star.fill")
                            }.foregroundColor(.orange)
                        }
                    }
                    Spacer()
                    NavigationLink(destination:
                               RestaurantPhotosView()
//                                    RestaurantPhotosView(photoUrlString: viewModel.details?.photos ?? [])
                                   ,
                                   label: {
                        Text("See more photos")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .frame(width: 80)
                            .multilineTextAlignment(.trailing)
                    })
                    
                } .padding()
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Location& Description")
                    .font(.system(size: 16, weight: .bold))
                Text("Tokyo, Japan")
                HStack{
                    ForEach(0..<5, id:\.self){ num in
                        Image(systemName: "dollarsign.circle.fill")
                    }.foregroundColor(.orange)
                }
                
                HStack { Spacer() }
            }.padding(.top)
                .padding(.horizontal)
            
                Text(viewModel.details?.description ?? "")
                    .padding(.top, 8)
                    .font(.system(size: 14, weight: .regular))
                    .padding(.horizontal)
                    .padding(.bottom)
            
            HStack {
                Text("Popilar Dises")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }.padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.details?.popularDishes ?? [], id:\.self) { item in
                        DishCell(dish: item)
                    }
                }.padding(.horizontal)
            }
            if let review = viewModel.details?.reviews {
                ReviewList(reviews: review)
            }
        }.navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}
struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailsView(restaurant: Restaurants(name: "Jaoan's Finest", imageName: "4"))}
    }
}
