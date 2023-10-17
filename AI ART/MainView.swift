//
//  MainView.swift
//  AI ART
//
//  Created by Saiful Islam Sagor on 20/9/23.
//

import SwiftUI
import GoogleMobileAds

struct AppOpenAdView: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            // No need to implement anything here
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, GADFullScreenContentDelegate {
        func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
                // Handle app open ad dismissal if needed
        }
    }
    
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        let adViewController = UIViewController()
        
            // Load the app open ad
        GADAppOpenAd.load(
            withAdUnitID: "ca-app-pub-3940256099942544/3419835294",
            request: GADRequest(),
            orientation: UIApplication.shared.windows.first?.windowScene?.interfaceOrientation ?? .unknown
        ) { (ad, error) in
            if let error = error {
                print("Failed to load app open ad with error: \(error.localizedDescription)")
                return
            }
            
            if let appOpenAd = ad {
                appOpenAd.fullScreenContentDelegate = context.coordinator
                
                do {
                     appOpenAd.present(fromRootViewController: adViewController)
                }
//                catch {
//                    print("Failed to present app open ad with error: \(error.localizedDescription)")
//                }
            }
        }
        
        return adViewController
    }
    
}

struct BannerVC: UIViewControllerRepresentable  {

    func makeUIViewController(context: Context) -> UIViewController {
        let adSize = GADAdSizeFromCGSize(CGSize(width: 320 , height: 100))

        let view = GADBannerView(adSize: adSize)

        let viewController = UIViewController()
        view.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: adSize.size)
        view.load(GADRequest())

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}


struct MainView: View {
    @StateObject var data = DataModel()
    var body: some View {
        TabView {
            
            ZStack{
                AppOpenAdView()
                SelfieView(data: data)
                
            }
                .tabItem {
                    Label("AI Selfies", systemImage: "face.smiling")
                }

            AvatarsView()
                .tabItem {
                    Label("Avatars", systemImage: "person.fill.viewfinder")
                }
            AvatarsView()
                .tabItem {
                    Label("Generate", systemImage: "wand.and.stars")
                }
            AvatarsView()
                .tabItem {
                    Label("Videos", systemImage: "play.rectangle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
