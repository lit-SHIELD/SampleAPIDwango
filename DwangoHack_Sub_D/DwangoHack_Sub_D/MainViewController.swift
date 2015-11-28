//
//  MainViewController
//  DwangoHack_Sub_D
//
//  Created by 坂本　大介 on 11/28/15.
//  Copyright © 2015 Daisuke Sakamoto. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

class MainViewController: UIViewController {
    
    
    @IBOutlet var imageGIF: UIImageView!
    
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        
        let gifUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ニコニコ2x", ofType: "gif")!)   //システムサウンドのパスを指定
        
        imageGIF.image = UIImage.animatedImageWithAnimatedGIFURL(gifUrl)
        
        let myUD = NSUserDefaults.standardUserDefaults()

        
        let keyWord : String = myUD.stringForKey("QID")!
        print(keyWord)
        
        
        let url =  "http://api.search.nicovideo.jp/api/v2/video/contents/search?q=" + keyWord + "&targets=title&fields=contentId,title,thumbnailUrl,description,viewCounter&filters[viewCounter][gte]=10&_sort=-viewCounter&_offset=0&_limit=10&_context=apiguide"
        
        //q         検索ワード
        //targets   qで何を探すか？
        //fields    fieldsは取得するプロパティを指定する
        //filters   検索する条件の指定
        //_sort     順番をつける（viewCounterは再生回数）
        //_offset   返ってくるコンテンツの取得オフセット。最大:1600
        //_limit    返ってくるコンテンツの最大数。最大:100
        //_context  サービスまたはアプリケーション名。最大:40文字
        
        
        
        Alamofire.request(.GET, url,parameters: nil).response{(request, response, data, error) in
            
            let json = JSON(data: data!)
            
            //jsonがnilであれば
            if(json != nil){
                print(json)
                self.GetJSON(json)
            }
        }
        
        //initなどでNSNotification登録
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "update:", name: "tap", object: nil)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "update2:", name: "Introduction", object: nil)

        

        
    }
    //関数で受け取った時のアクションを定義
    func update(notification: NSNotification)  {
        let targetViewController = self.storyboard!.instantiateViewControllerWithIdentifier( "MovieViewController" ) as! MovieViewController
        
        if let userInfo = notification.userInfo {
            let result = userInfo["value"]! as! String
            print("受信した数値：\(result)")
        
        targetViewController.targetURL = result
        
        self.presentViewController( targetViewController, animated: true, completion: nil)
        }
    

    }
    //関数で受け取った時のアクションを定義
    func update2(notification: NSNotification)  {
        
        if let userInfo = notification.userInfo {
            let result = userInfo["value"]! as! String
            print("受信した数値：\(result)")
            
            let alertController = UIAlertController(title: "動画紹介", message: result, preferredStyle: .Alert)
            let otherAction = UIAlertAction(title: "OK", style: .Default) {
                action in print("pushed OK!")
            }

            alertController.addAction(otherAction)
            presentViewController(alertController, animated: true, completion: nil)
            
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func GetJSON(json : JSON){
        
        var cardInfos:[CardInfo] = []
        
        let count:Int = json["data"].count
        
        for (var i = 0 ; i < count ; i++){
            let cardInfo = CardInfo()
            
            //jsonのデータの取得
            cardInfo.title = (String)(json["data"][i]["title"])
            cardInfo.image_url = (String)(json["data"][i]["thumbnailUrl"])
            cardInfo.url = "http://nico.ms/" + (String)(json["data"][i]["contentId"])
            cardInfo.description = (String)(json["data"][i]["description"])
            
            cardInfos.append(cardInfo)
            
        }
        
        let rect : CGRect = CGRectMake(0,0,self.view.frame.width,view.frame.height / 2)
        
        let draggableBackground = DraggableViewBackground(frame: rect)
        
        draggableBackground.cards = cardInfos
        
        //NSNotificationのインスタンスを作成。["value":100]という辞書型のデータを持たせる
        let n : NSNotification = NSNotification(name: "dummy", object: self, userInfo: ["value": 100])
        //通知を送る
        NSNotificationCenter.defaultCenter().postNotification(n)
        
        
        self.view.addSubview(draggableBackground)
        
    }
    
    
}

