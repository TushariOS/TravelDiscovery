//
//  RestaurantPhotosView.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 21/06/23.
//

import SwiftUI
import Kingfisher

struct RestaurantPhotosView: View {
    let photoUrlString =  ["https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a4d85eff-4c79-4141-a0d6-761cca48eae1",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/20a6783b-3de7-4e58-9e22-bcc6a43b6df6",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/0d1d2e79-2f10-4cfd-82da-a1c2ab3638d2",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/3923d237-3931-44e5-836f-5de40ec04b31",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/254c0418-2b55-4a2b-b530-a31a9799c7d5",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/fa20d064-b6d7-4df9-8f44-0f25f6ee5a19",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a441d22b-5324-4444-8ddf-22b99128838c",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/6b5d013b-dc3b-4e5e-93d9-ec932f42aead",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a6de1d65-8fa3-4674-a6ce-a207b8f86b15",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/5c6bc68c-a8a1-42ac-ab3a-947927826807",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a5e83c0c-c815-4129-bfd4-17e73fa1da78",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/f6ee5fb7-b21b-42c1-b1d8-a455742d0247",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/c22e8d9e-10f2-4559-8c81-375491295e84",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/3a352f87-3dc1-4fa7-affe-fb12fa8691fe",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/8ca76521-1f52-4043-8b86-d2a573342daf",
                         "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/73f69749-f986-46ac-9b8b-d7b1d42bddc5"]
    
    @State var mode = "grid"
    @State var shouldShowFullScreenModal = false
    @State var selectedPhotoIndex = 0
    init() {
        // UISegmentedControl for all segemnt picker in whole app
        UISegmentedControl.appearance().backgroundColor = .black
        UISegmentedControl.appearance().selectedSegmentTintColor = .orange
        let titletextAttibuted = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titletextAttibuted, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(titletextAttibuted, for: .normal)
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                Picker("Test", selection: $mode) {
                    Text("Grid").tag("grid")
                    Text("List").tag("list")
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                
                Spacer()
                    .fullScreenCover(isPresented: $shouldShowFullScreenModal, content: {
                        ZStack(alignment: .topLeading) {
                            Color.black.ignoresSafeArea()
                            RestaurantCarouselView(imageNames: photoUrlString, selectedIndex: selectedPhotoIndex)
                            
                            Button(action: {
                                shouldShowFullScreenModal.toggle()
                            }, label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(.white)
                                  //  .padding()
                            })
                        }
                    }).opacity(shouldShowFullScreenModal ? 1 : 0)
                
                if mode == "grid" {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: proxy.size.width / 3 - 4, maximum: 300 ), spacing: 2)],
                              spacing: 4, content: {
                        ForEach(photoUrlString, id: \.self){ url in
                            Button(action: {
                                shouldShowFullScreenModal.toggle()
                                selectedPhotoIndex = photoUrlString.firstIndex(of: url) ?? 0
                            }, label: {
                                KFImage(URL(string: url))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: proxy.size.width / 3 - 3, height: proxy.size.width / 3 - 3)
                                    .clipped()
                            })
                        }
                        
                    }).padding(.horizontal, 2)
                } else {
                    ForEach(photoUrlString, id: \.self){ url in
                        VStack(alignment: .leading, spacing: 8) {
                            KFImage(URL(string: url))
                                .resizable()
                            .scaledToFill()
                            HStack {
                                Image(systemName: "heart")
                                Image(systemName: "bubble.right")
                                Image(systemName: "paperplane")
                                Spacer()
                                Image(systemName: "bookmark")
                            }.padding(.horizontal, 8)
                                .font(.system(size: 22))
                            Text("Tomorrow, Friday - I am going to make some changes to the CI stack to support Apple Silicon, as Bitrise is dropping support for intel stacks starting June 15.")
                                .font(.system(size: 14, weight: .semibold))
                                .padding(.horizontal, 8)
                            Text("Posted on 11/12/2026")
                                .font(.system(size: 14, weight: .semibold))
                                .padding(.horizontal, 8)
                                .foregroundColor(.gray)
                        }.padding(.bottom, 8)
                            
                    }
                }
            }
        }.navigationBarTitle("Photos", displayMode: .inline)
    }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantPhotosView()
        }
    }
}
/*
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a4d85eff-4c79-4141-a0d6-761cca48eae1",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/20a6783b-3de7-4e58-9e22-bcc6a43b6df6",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/0d1d2e79-2f10-4cfd-82da-a1c2ab3638d2",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/3923d237-3931-44e5-836f-5de40ec04b31",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/254c0418-2b55-4a2b-b530-a31a9799c7d5",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/fa20d064-b6d7-4df9-8f44-0f25f6ee5a19",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a441d22b-5324-4444-8ddf-22b99128838c",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/6b5d013b-dc3b-4e5e-93d9-ec932f42aead",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a6de1d65-8fa3-4674-a6ce-a207b8f86b15",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/5c6bc68c-a8a1-42ac-ab3a-947927826807",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a5e83c0c-c815-4129-bfd4-17e73fa1da78",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/f6ee5fb7-b21b-42c1-b1d8-a455742d0247",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/c22e8d9e-10f2-4559-8c81-375491295e84",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/3a352f87-3dc1-4fa7-affe-fb12fa8691fe",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/8ca76521-1f52-4043-8b86-d2a573342daf",
 "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/73f69749-f986-46ac-9b8b-d7b1d42bddc5"
 */
