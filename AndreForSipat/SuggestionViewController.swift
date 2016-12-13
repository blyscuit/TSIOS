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
    
    
}


extension SuggestionViewController: TGLParallaxCarouselDelegate {
    
    func numberOfItemsInCarouselView(_ carouselView: TGLParallaxCarousel) -> Int {
        return 8
    }
    
    func carouselView(_ carouselView: TGLParallaxCarousel, itemForRowAtIndex index: Int) -> TGLParallaxCarouselItem {
        return CustomView(frame: CGRect(x: 0, y: 0, width: 300, height: 150) , pic: "SS\(index)")
    }
    
    func carouselView(_ carouselView: TGLParallaxCarousel, didSelectItemAtIndex index: Int) {
        print("Tap on item at index \(index)")
    }
    
    func carouselView(_ carouselView: TGLParallaxCarousel, willDisplayItem item: TGLParallaxCarouselItem, forIndex index: Int) {
        print("")
    }
}
