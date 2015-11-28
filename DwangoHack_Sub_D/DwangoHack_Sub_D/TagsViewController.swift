//
//  TagsViewController.swift
//  DwangoHack_Sub_D
//
//  Created by ShinokiRyosei on 2015/11/28.
//  Copyright © 2015年 Daisuke Sakamoto. All rights reserved.
//

import UIKit

class TagsViewController: UIViewController {
    
    @IBOutlet var nicoTagsLabels: [UILabel]!
    @IBOutlet var hatenaTagsLabels: [UILabel]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nicoColor = UIColor(red: 245.0 / 255.0, green: 184.0 / 255.0, blue: 63.0 / 255.0, alpha: 1.0)
        let hatenaColor = UIColor(red: 168.0 / 255.0, green: 203.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0)
        
        for nicoTagsLabel in nicoTagsLabels {
            nicoTagsLabel.textColor = UIColor.redColor()
            nicoTagsLabel.layer.borderColor = nicoColor.CGColor
            nicoTagsLabel.layer.borderWidth = 10
//            nicoTagsLabel.backgroundColor = UIColor.whiteColor()
        }
        
        for hatenaTagsLabel in hatenaTagsLabels {
            hatenaTagsLabel.textColor = UIColor.redColor()
            hatenaTagsLabel.layer.borderColor = hatenaColor.CGColor
            hatenaTagsLabel.layer.borderWidth = 10
//            hatenaTagsLabel.backgroundColor = UIColor.whiteColor()
            
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
