//
//  SearchViewController.swift
//  DwangoHack_Sub_D
//
//  Created by ShinokiRyosei on 2015/11/28.
//  Copyright © 2015年 Daisuke Sakamoto. All rights reserved.
//

import UIKit
import ParkedTextField

class SearchViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        searchTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    

}
