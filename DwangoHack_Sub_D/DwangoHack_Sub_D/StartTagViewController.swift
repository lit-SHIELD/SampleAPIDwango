//
//  StartTagViewController.swift
//  DwangoHack_Sub_D
//
//  Created by sugawashiro on 2015/11/28.
//  Copyright © 2015年 Daisuke Sakamoto. All rights reserved.
//

import UIKit

var StartTag:[String] = ["","","","","","","","","",""]
var StartTagFlg:[Bool] = [false,false,false,false,false,false,false,false,false,false]
let userDefaults = NSUserDefaults.standardUserDefaults()
var goTag : String = ""
class StartTagViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func sport(sender: AnyObject) {
        btnTag(0,str: "sport")
        
    }
    
    @IBAction func game(sender: AnyObject) {
        btnTag(1,str: "game")
    }
    @IBAction func entertainments(sender: AnyObject) {
        btnTag(2,str: "entertainments")
    }
    
    @IBAction func niconiconamahoso(sender: AnyObject) {
        btnTag(3,str: "niconiconamahoso")

    }
    @IBAction func food(sender: AnyObject) {
        btnTag(4,str: "food")
    }
    
    @IBAction func trip(sender: AnyObject) {
        btnTag(5,str: "trip")
    }
    
    @IBAction func app(sender: AnyObject) {
        btnTag(6,str: "app")
    }
    @IBAction func akb(sender: AnyObject) {
        btnTag(7,str: "akb")
    }
    
    @IBAction func iphone(sender: AnyObject) {
        btnTag(8,str: "iphone")
    }
    
    
    @IBAction func news(sender: AnyObject) {
        btnTag(9,str: "news")
    }
    
    func btnTag(i : Int , str : String){
        if(StartTagFlg[i] == false){
            StartTag[i] = str
            StartTagFlg[i] = true
        }else{
            StartTag[i] = ""
            StartTagFlg[i] = false
        }
    
    
    }
    
    @IBAction func go(sender: AnyObject) {
        for var i = 0; i < 10; ++i {
            if(StartTag[i] == ""){
                print("nulTag:" + StartTag[i])
                
            }else if(goTag == ""){
                goTag = StartTag[i]
            
            }else{
                goTag += " OR " + StartTag[i]
            }
       
        }
        print("GO:" + goTag)
        
       userDefaults.setObject(goTag, forKey: "QID")
        
    }
    
    
    
    

}
