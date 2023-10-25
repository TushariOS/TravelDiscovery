//
//  UserDetailsView.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 24/06/23.
//

import SwiftUI
import Kingfisher

struct UserDetails: Decodable {
    let  username, firstName, lastName, profileImage: String
    let followers, following: Int
    let posts: [Post]
}

struct Post: Decodable, Hashable {
    let title,imageUrl, views: String
    let hashtags: [String]
}

class UserDetailsViewModel: ObservableObject {
    @Published var userDetails: UserDetails?
    
    init(userId: Int) {
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/user?id=\(userId)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, errror) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    self.userDetails =  try JSONDecoder().decode(UserDetails.self, from: data)
                } catch let error {
                    print("JSON error", error)
                }
            }
          
        }.resume()
    }
    
}

struct UserDetailsView: View {
    let user: Creatore
    @ObservedObject var viewModel: UserDetailsViewModel
    init(user: Creatore) {
        self.user = user
        viewModel = .init(userId: user.id)
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 13) {
                KFImage(URL(string: viewModel.userDetails?.profileImage ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
                    .padding(.top, 5)
                Text((viewModel.userDetails?.firstName ?? "") + " " + (viewModel.userDetails?.lastName ?? ""))
                    .font(.system(size: 14, weight: .bold))
                HStack {
                    Text("\(viewModel.userDetails?.username ?? "") •")
                    Image(systemName: "hand.thumbsup")
                        .font(.system(size: 12, weight: .bold))
                    Text(user.name)
                }.font(.system(size: 14, weight: .bold))
                        
                Text("YouTuber, Vlogger, Travel Creatore")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(.lightGray))
                HStack(spacing: 12) {
                    VStack {
                        Text("\(viewModel.userDetails?.followers ?? 0)")
                            .font(.system(size: 14, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(Color(.lightGray))
                    }
                    
                    Spacer()
                        .frame(width: 0.5, height: 18)
                        .background(Color(.gray))
                    
                    VStack {
                        Text("\(viewModel.userDetails?.following ?? 0)")
                            .font(.system(size: 14, weight: .semibold))
                        Text("Following")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(Color(.lightGray))
                    }
                }
                
                HStack(spacing: 10) {
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Following")
                            
                                .foregroundColor(Color(.white))
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color(.orange))
                        .cornerRadius(100)
                    })
                    
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Contact")
                                .foregroundColor(Color(.black))
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color(.lightGray))
                        .cornerRadius(100)
                    })
                    
                }.font(.system(size: 11, weight: .semibold))
                
                ForEach(viewModel.userDetails?.posts ?? [], id: \.self) { num in
                    VStack(alignment: .leading) {
                        KFImage(URL(string: num.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                        
                        HStack {
                            Image("6")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text(num.title)
                                    .font(.system(size: 14, weight: .semibold))
                                Text("\(num.views) Views")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(Color(.lightGray))
                            }
                        }.padding(.horizontal, 8)
                        HStack {
                            ForEach(num.hashtags, id:\.self) { num in
                                Text("#\(num)")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(Color(.blue))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .background(Color(.lightGray))
                                    .cornerRadius(20)
                            }
                        }.padding(.bottom)
                            .padding(.horizontal)
                        
                    }
                    //                    .frame(height: 200)
                    .background(Color(white: 1))
                    .cornerRadius(10)
                    .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
                    
                }
            }.padding(.horizontal)
            
        }.navigationBarTitle(user.name, displayMode: .inline)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailsView(user: .init(id: 0, imageName: "6", name: "Jhon"))
        }
    }
}
