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

class OpViewController: UIViewController {

    
    @IBOutlet var imageGIF: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        

        let gifUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ニコニコ2x", ofType: "gif")!)   //システムサウンドのパスを指定
        
        imageGIF.image = UIImage.animatedImageWithAnimatedGIFURL(gifUrl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

