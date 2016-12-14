//
//  SuggestionViewController.swift
//  AndreForSipat
//
//  Created by Bliss Watchaye on 2016-12-14.
//  Copyright © 2016 confusians. All rights reserved.
//

import Foundation
import UIKit
class LocationViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    let markerLocation = [CGPoint(x:83, y:207),CGPoint(x:76, y:125),CGPoint(x:112, y:36)]
    @IBOutlet weak var mapView: UIImageView!
    var refreshControl: UIRefreshControl!
    var marker:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLocation();
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: Selector("refresh"), for: UIControlEvents.valueChanged)
        scrollView.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadLocation(){
        let deadlineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            let beaconSection = Int(arc4random_uniform(3) + 0)
            if(!(self.marker != nil)){
                self.marker = UIImageView(frame: CGRect(x: self.markerLocation[beaconSection].x, y: self.markerLocation[beaconSection].y, width: 28, height: 28))
                self.marker.image = UIImage(named: "marker")
                self.mapView.addSubview(self.marker)
            }else{
                self.marker.frame = CGRect(x: self.markerLocation[beaconSection].x, y: self.markerLocation[beaconSection].y, width: 28, height: 28)
            }
            
            self.refreshControl.endRefreshing()
        }
        
    }
    
    func refresh() {
        // Code to refresh table view
        loadLocation()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Location"
    }
    
}
