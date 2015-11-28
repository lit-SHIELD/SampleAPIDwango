//
//  SearchViewController.swift
//  DwangoHack_Sub_D
//
//  Created by ShinokiRyosei on 2015/11/28.
//  Copyright © 2015年 Daisuke Sakamoto. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var searchTextField: UITextField!
   
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        searchTextField.delegate = self
        
        searchButton.layer.cornerRadius = searchButton.layer.bounds.width/2
        searchButton.clipsToBounds = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if searchTextField.text != nil {
        userDefaults.setObject(searchTextField.text, forKey: "QID")
        }
        textField.resignFirstResponder()
        return true
    }
    
    

    

}
