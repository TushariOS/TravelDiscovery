//
//  PopularDestinationDetailsView.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 11/06/23.
//

import SwiftUI
import MapKit

struct DestinationDetails: Codable {
  //  let id: Int
    let name, description: String
  //  let thumbnail: String
    let photos: [String]
   // let related: [[Related]]
   // let latitude, longitude: Double
}

// MARK: - Related
struct Related: Codable {
    let name, country: String
    let thumbnail: String?
}

class DestinationDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var destinationDetails: DestinationDetails?
    
    init(name: String) {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/destination?name=\(name.lowercased())"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, errror) in
            
            DispatchQueue.main.async {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                    self.isLoading = false
                    //self.errorMessage = "Bad Request \(statusCode)"
                    return
                }
                guard let data = data else { return}
                do {
                    let details = try JSONDecoder().decode(DestinationDetails.self, from: data)
                    self.destinationDetails = details
                } catch {
                    print(error.localizedDescription)
                }
                self.isLoading = false
            }
        }.resume()
    }
}



struct PopularDestinationDetailsView: View {
    let destination: Destination
    @State var region: MKCoordinateRegion
    @State var isShowAttraction = true
    @ObservedObject var viewModel: DestinationDetailsViewModel
    
    let attraction: [Attraction] = [.init(name: "Eiffel Tower", lattitude: 48.858605, longitude: 2.2946, image: "1"),
                                    .init(name: "Champs-Elysees", lattitude: 48.866867, longitude: 2.311780, image: "2"),
                                    .init(name: "Louver Musem", lattitude: 48.860288, longitude: 2.337789, image: "3")]
    
    init(destination: Destination) {
        self.destination = destination
        self.region = MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self.viewModel = .init(name: destination.name)
    }
    
    
    var body: some View {
        ScrollView {
            if let photos = viewModel.destinationDetails?.photos {
                DestinationViewHeader(imageNames: photos)
                    .frame(height: 250)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.destinationDetails?.name ?? "")
                    .font(.system(size: 18, weight: .bold))
                Text(destination.country)
                    .font(.system(size: 12, weight: .light))

                HStack {
                    ForEach (0..<5, id: \.self) { item in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top, 1)
                
                HStack {
                    Text(viewModel.destinationDetails?.description ?? "")
                        .padding(.top, 4)
                        .font(.system(size: 14))
                    Spacer()}
            } .padding(.horizontal)
            
            HStack {
                Text("Location")
                    .font(.system(size: 18, weight: .bold))
                Spacer()
                Button(action: {
                    isShowAttraction.toggle()
                }, label: {
                    Text("\(isShowAttraction ? "Hide" : "Show") Attraction")
                        .font(.system(size: 12, weight: .semibold))
                })
                Toggle("", isOn: $isShowAttraction)
                    .labelsHidden()
            }.padding(.horizontal)
                .padding(.top, 5)
            Map(coordinateRegion: $region, annotationItems: isShowAttraction ? attraction : []) {
                attraction in
                MapAnnotation(coordinate: .init(latitude: attraction.lattitude, longitude: attraction.longitude)) {
                    CustomeAnnotation(attraction: attraction)
                }
                // MapMarker(coordinate: .init(latitude: attraction.lattitude, longitude: attraction.longitude), tint: .blue)
            }
            .frame(height: 300)
        } .navigationBarTitle(destination.name, displayMode: .inline)
    }
}

struct PopularDestinationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationDetailsView(destination: .init(name: "Paris", country: "France", imageName: "3", latitude: 48.859565, longitude: 2.35235))
    }
}

struct CustomeAnnotation: View {
    let attraction: Attraction
    
    var body: some View {
        VStack {
            Image(attraction.image)
                .resizable()
                .frame(width: 80, height: 60)
            Text(attraction.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
        }
        .cornerRadius(5)
        .shadow(radius: 5)
    }
}
