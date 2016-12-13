//
//  SuggestionViewController.swift
//  AndreForSipat
//
//  Created by Bliss Watchaye on 2016-12-14.
//  Copyright © 2016 confusians. All rights reserved.
//

import Foundation
import UIKit
class SuggestionViewController: UIViewController {
    @IBOutlet weak var carouselView: TGLParallaxCarousel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carouselView.delegate = self
        carouselView.margin = 2
        carouselView.selectedIndex = 1
        carouselView.type = .threeDimensional
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


extension SuggestionViewController: TGLParallaxCarouselDelegate {
    
    func numberOfItemsInCarouselView(_ carouselView: TGLParallaxCarousel) -> Int {
        return 8
    }
    
    func carouselView(_ carouselView: TGLParallaxCarousel, itemForRowAtIndex index: Int) -> TGLParallaxCarouselItem {
        return CustomView(frame: CGRect(x: 0, y: 0, width: 300, height: 150) , pic: "SS\(index+1)")
    }
    
    func carouselView(_ carouselView: TGLParallaxCarousel, didSelectItemAtIndex index: Int) {
        print("Tap on item at index \(index)")
        let viewToFlick = UIView(frame: CGRect(x: 0, y: 0, width: 280, height: 300))
        viewToFlick.backgroundColor = .white
        // Optional - See FlickToDismissOption for available options.
        let options: [FlickToDismissOption] = [
            .Animation(.Scale),
            .BackgroundColor(UIColor(white: 0.0, alpha: 0.8))
        ]
        let vc = FlickToDismissViewController(flickableView: viewToFlick, options: options)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        vc.imageName = "SS\(index+1)"
        present(vc, animated: true, completion: nil)
    }
    
    func carouselView(_ carouselView: TGLParallaxCarousel, willDisplayItem item: TGLParallaxCarouselItem, forIndex index: Int) {
        print("")
    }
    
}
