//
//  ReviewList.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 20/06/23.
//

import SwiftUI
import Kingfisher

struct ReviewList: View {
    let reviews: [Review]
    var body: some View {
        HStack {
            Text("Customer Reviews")
                .font(.system(size: 16, weight: .bold))
            Spacer()
        }.padding(.horizontal)
        
        ForEach(reviews, id: \.self) { review in
            VStack(alignment: .leading) {
                HStack {
                    KFImage(URL(string: review.user.profileImage))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(review.user.firstName) \(review.user.lastName)")
                            .font(.system(size: 14, weight: .bold))
                        HStack(spacing: 4) {
                            ForEach(0..<review.rating, id: \.self) { num in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                            }
                            ForEach(0..<5 - review.rating, id: \.self) { num in
                                Image(systemName: "star.fill")
                                
                                    .foregroundColor(.gray)
                            }
                        }.font(.system(size: 12))
                    }
                    Spacer()
                    Text("Dec 2022")
                        .font(.system(size: 12, weight: .light))
                }
                Text(review.text)
                    .font(.system(size: 12, weight: .regular))
            }.padding(.top)
                .padding(.horizontal)
        }
    }
}

struct ReviewList_Previews: PreviewProvider {
    static var previews: some View {
        ReviewList(reviews: [.init(rating: 1, text: "Review test", user: .init(id: 1, username: "Adam", firstName: "Gomes", lastName: "Andral", profileImage: "1"))])
    }
}
