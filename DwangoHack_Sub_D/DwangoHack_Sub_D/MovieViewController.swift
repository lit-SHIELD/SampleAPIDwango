//
//  MovieViewController.swift
//  DwangoHack_Sub_D
//
//  Created by 坂本　大介 on 11/28/15.
//  Copyright © 2015 Daisuke Sakamoto. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backButton: UIButton!
    
    var targetURL = "http://www.nicovideo.jp/watch/sm1097445"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        backButton.layer.cornerRadius = 10
        backButton.clipsToBounds = true;

        
        
        loadAddressURL()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAddressURL() {
        let requestURL = NSURL(string: targetURL)
        let req = NSURLRequest(URL: requestURL!)
        
        webView.loadRequest(req)
        
    }

    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
