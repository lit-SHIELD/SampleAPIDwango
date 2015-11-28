//
//  TagsViewController.swift
//  DwangoHack_Sub_D
//
//  Created by ShinokiRyosei on 2015/11/28.
//  Copyright © 2015年 Daisuke Sakamoto. All rights reserved.
//

import UIKit

class TagsViewController: UIViewController {
    
    var searchTagArray: [String] = []
    
    @IBOutlet var nicoTagButtons: [UIButton]!
    @IBOutlet var hatenaTagButtons: [UIButton]!
    
    var nicoTagArray = ["Sugawa", "RioRio", "AyumuTakahama", "Honami", "Maoko"]
    var hatenaTagArray = ["YukiFutagami", "ShokoYamamoto", "MoeTakei♡", "geba", "Shinra"]
    
    let nicoColor = UIColor(red: 245.0 / 255.0, green: 184.0 / 255.0, blue: 63.0 / 255.0, alpha: 1.0)
    let hatenaColor = UIColor(red: 168.0 / 255.0, green: 203.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0)
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
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
            nicoTagButtons[i].setTitle(nicoTagArray[i], forState: UIControlState.Normal)
            nicoTagButtons[i].tintColor = nicoColor
            nicoTagButtons[i].sizeToFit()
        }
        
        
        for j in 0 ..< 5 {
            hatenaTagButtons[j].setTitle(hatenaTagArray[j], forState: UIControlState.Normal)
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
        if sender.tintColor == nicoColor {
            sender.tintColor = UIColor.whiteColor()
            sender.backgroundColor = nicoColor
            searchTagArray.append(sender.currentTitle!)
        } else {
            sender.tintColor = nicoColor
            sender.backgroundColor = UIColor.whiteColor()
            searchTagArray.removeLast()
        }
        
    }
    
    @IBAction func searchStart(sender: AnyObject) {
        self.saveQID()
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func hatenaChangeColor(sender: UIButton) {
        if sender.tintColor == hatenaColor {
            sender.tintColor = UIColor.whiteColor()
            sender.backgroundColor = hatenaColor
            searchTagArray.append(sender.currentTitle!)
        } else {
            sender.tintColor = hatenaColor
            sender.backgroundColor = UIColor.whiteColor()
            searchTagArray.removeLast()
        }
    }
    
    private func saveQID() {
        var searchWord: String = ""
        for i in 0 ..< searchTagArray.count {
            
            
            if i > 0 {
                searchWord = searchWord + " OR " + searchTagArray[i]
            } else {
                searchWord = searchTagArray[i]
            }
            print(searchWord)
        }
        
        userDefaults.setObject(searchWord, forKey: "QID")
        
        
    }
    
    
}
