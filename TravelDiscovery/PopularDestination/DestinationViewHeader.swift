//
//  DestinationViewHeader.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 13/06/23.
//

import SwiftUI
import Kingfisher

struct DestinationViewHeader: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    let imageNames: [String]
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = CustomePageViewController(imageNames: imageNames)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

class CustomePageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        if index == 0 { return nil }
        return allControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        if index == allControllers.count - 1 { return nil }
        return allControllers[index + 1]
    }
    
//    let firstVc = UIHostingController(rootView: Text("First VC"))
//    let secondVc = UIHostingController(rootView: Text("Second VC"))
//    let thirdVc = UIHostingController(rootView: Text("Second VC"))
        var allControllers: [UIViewController] = []
    init(imageNames:[String]) {
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.systemRed
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        allControllers = imageNames.map({ imagName in
            let hostingViewController =
            UIHostingController(rootView:
                KFImage(URL(string: imagName))
                .resizable()
                .scaledToFill())
            hostingViewController.view.clipsToBounds = true
            return hostingViewController
        })
        if imageNames.count > 0 {
            setViewControllers([allControllers.first!], direction: .forward, animated: true)
        }
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct DestinationViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        DestinationViewHeader(imageNames: ["https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/7156c3c6-945e-4284-a796-915afdc158b5",
                                           "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702",
                                            "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531",
                                           "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e"])
    }
}
