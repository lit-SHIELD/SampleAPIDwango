//
//  TagsViewController.swift
//  DwangoHack_Sub_D
//
//  Created by ShinokiRyosei on 2015/11/28.
//  Copyright © 2015年 Daisuke Sakamoto. All rights reserved.
//

import UIKit

class TagsViewController: UIViewController {
    
    
    
    @IBOutlet var nicoTagButtons: [UIButton]!
    @IBOutlet var hatenaTagButtons: [UIButton]!
    
    var nicoTagArray = ["すがわ", "りおりお", "AyumuTakahama", "ほなみ", "まあこ"]
    var hatenaTagArray = ["Yuki Futagami", "Shoko Yamamoto", "Moe Takei♡", "geba", "Shinra"]
    
    let nicoColor = UIColor(red: 245.0 / 255.0, green: 184.0 / 255.0, blue: 63.0 / 255.0, alpha: 1.0)
    let hatenaColor = UIColor(red: 168.0 / 255.0, green: 203.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       

        
        for nicoTagButton in nicoTagButtons {
            nicoTagButton.layer.borderWidth = 3
            nicoTagButton.layer.borderColor = nicoColor.CGColor
        }
        
        for hatenaTagButton in hatenaTagButtons {
            hatenaTagButton.layer.borderWidth = 3
            hatenaTagButton.layer.borderColor = hatenaColor.CGColor
            
        }
        
       
        
        for i in 0 ..< 5 {
            nicoTagButtons[i].setTitle(nicoTagArray[i], forState: .)
            nicoTagButtons[i].tintColor = nicoColor
            nicoTagButtons[i].sizeToFit()
        }
        
        
        for j in 0 ..< 5 {
            hatenaTagButtons[j].setTitle(hatenaTagArray[j], forState: .Default)
            hatenaTagButtons[j].tintColor = hatenaColor
            hatenaTagButtons[j].sizeToFit()
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nicoChangeColor(sender: UIButton) {
        
        sender.tintColor = UIColor.whiteColor()
        sender.backgroundColor = nicoColor
        
    }
    
    @IBAction func hatenaChangeColor(sender: UIButton) {
        sender.tintColor = UIColor.whiteColor()
        sender.backgroundColor = hatenaColor
    }
    
}
