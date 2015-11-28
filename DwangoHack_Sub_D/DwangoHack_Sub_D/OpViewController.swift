//
//  OpViewController
//  DwangoHack_Sub_D
//
//  Created by 坂本　大介 on 11/28/15.
//  Copyright © 2015 Daisuke Sakamoto. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class OpViewController: UIViewController , UITextFieldDelegate{

    
    @IBOutlet weak var tagText: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tagText.delegate = self
        // Do any additional setup after loading the view, typically from a nib
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    UITextFieldが編集された直後に呼ばれるデリゲートメソッド.
    */
    func textFieldDidBeginEditing(textField: UITextField){
        print("textFieldDidBeginEditing:" + textField.text!)
    }
    
    /*
    UITextFieldが編集終了する直前に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        
        return true
    }
    
    /*
    改行ボタンが押された際に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        let myUD = NSUserDefaults.standardUserDefaults()
        myUD.setValue(textField.text!, forKey: "QID")

        print( myUD.stringForKey("QID")! )
        textField.resignFirstResponder()
        
        return true
    }

    @IBAction func back(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    

}

