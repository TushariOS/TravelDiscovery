//
//  Utility.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 08/06/23.
//

import SwiftUI

struct ActivityIndicatiorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        indicator.color = .white
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
    typealias UIViewType = UIActivityIndicatorView
}


struct Utility_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatiorView()
    }
}
