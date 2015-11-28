//
//  CardInfo.swift
//  DwangoHack_Sub_D
//
//  Created by 坂本　大介 on 11/28/15.
//  Copyright © 2015 Daisuke Sakamoto. All rights reserved.
//

import Foundation

class CardInfo{
    
    
    var title:String! //タイトル
    
    var image_url:String! //url
    
    var description:String! //説明文
    
    var url:String!//飛ぶリンク

    
    
    
    
    class var sharedInstance: CardInfo {
        struct Static {
            static let instance: CardInfo = CardInfo()
        }
        return Static.instance
    }
    
}