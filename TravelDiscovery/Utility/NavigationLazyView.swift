//
//  NavigationLazyView.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 11/06/23.
//

import SwiftUI

struct NavigationLazyView<T: View>: View {
    let build: () -> T
    
    init(_ build: @autoclosure @escaping () -> T) {
        self.build = build
    }
    
    var body: T {
        build()
    }
}
