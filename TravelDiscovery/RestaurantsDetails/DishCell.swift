//
//  DishCell.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 19/06/23.
//

import SwiftUI
import Kingfisher

struct DishCell: View {
    let dish: Dish
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                KFImage(URL(string: dish.photo))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 80)
                    .cornerRadius(5.0)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke( Color.gray))
                    .shadow(radius: 2)
                LinearGradient(colors: [Color.clear, Color.black], startPoint: .center, endPoint: .bottom)
                Text("$\(dish.price)")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .regular))
                    .padding(.bottom, 6)
                    .padding(.horizontal, 4)
            }
            .frame(height: 80)
            .cornerRadius(5)
            Text(dish.name)
                .foregroundColor(.gray)
                .font(.system(size: 14, weight: .bold))
            Text("\(dish.numPhotos) Photos")
                .foregroundColor(.gray)
                .font(.system(size: 12, weight: .regular))
        }
    }
}


struct DishCell_Previews: PreviewProvider {
    static var previews: some View {
        DishCell(dish: Dish(name: "test", price: "12", photo: "1", numPhotos: 10))
    }
}
