//
//  OverlayView.swift
//  EnWord
//
//  Created by 坂本　大介 on 11/24/15.
//  Copyright © 2015 Daisuke Sakamoto. All rights reserved.
//

import Foundation
import UIKit

enum GGOverlayViewMode: Int {
    case Left
    case Right
}

class OverlayView: UIView{
    var mode: GGOverlayViewMode?
    var imageView: UIImageView = UIImageView()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        imageView = UIImageView(image:UIImage(named: "mark_cross.png"))
        self.addSubview(imageView)
    }
    
    func setMode(mode: GGOverlayViewMode) {
        print("load setMode")
        
        print(mode)
        if mode == GGOverlayViewMode.Left {
            imageView.frame = CGRectMake(100, 100, 100, 100)
            imageView.image = UIImage(named: "mark_cross.png")
        } else {
            imageView.frame = CGRectMake(0, 100, 100, 100)
            imageView.image = UIImage(named: "mark_circle.png")
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRectMake(50, 50, 100, 100)
    }
}