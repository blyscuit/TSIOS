//
//  TabBarViewController.swift
//  AndreForSipat
//
//  Created by Romson Preechawit on 14/12/16.
//  Copyright © 2016 confusians. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navbar = self.navigationController!.navigationBar
        navbar.barTintColor = UIColor(red:0.45, green:0.65, blue:0.07, alpha:1.0)
        navbar.tintColor = UIColor.white
        navbar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
