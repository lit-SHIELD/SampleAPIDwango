//
//  DraggableViewBackground.swift
//  EnWord
//
//  Created by 坂本　大介 on 11/24/15.
//  Copyright © 2015 Daisuke Sakamoto. All rights reserved.
//

import Foundation
import UIKit

class DraggableViewBackground: UIView, DraggableViewDelegate{
    
    var cardsLoadedIndex:Int = Int()
    var loadedCards: NSMutableArray = NSMutableArray()
    
    var menuButton: UIButton = UIButton()
    var messageButton: UIButton = UIButton()
    var xButton: UIButton = UIButton()
    var checkButton: UIButton = UIButton()
    
    let MAX_BUFFER_SIZE: Int = 2
    let CARD_HEIGHT: CGFloat = 260
    let CARD_WIDTH: CGFloat = 260
    
    var cards:[CardInfo]!

    var allCards: NSMutableArray = NSMutableArray()
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.layoutSubviews()
        self.setupView()
        
        loadedCards = []
        cardsLoadedIndex = 0
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "update:", name: "dummy", object: nil)
        
        
        
    }
    
    //関数で受け取った時のアクションを定義
    func update(notification: NSNotification)  {
        self.loadCards()
    }
    
    func setupView() {
        
        
        //self.backgroundColor = UIColor(red: 0.92, green: 0.93, blue: 0.95, alpha: 1.0);

    }
    
    func createDraggableViewWithDataAtIndex(index: Int) -> DraggableView {
        let draggableView: DraggableView = DraggableView(frame:CGRectMake(40, 63, CARD_WIDTH - 20, CARD_HEIGHT - 80))
        draggableView.information.text = cards[index].title
        draggableView.information.numberOfLines = 3
        draggableView.information.textColor = UIColor.redColor()
        draggableView.informationView.backgroundColor = UIColor.grayColor()
        
        // UIImageViewのインスタンス
        // URLを指定しsたUIImageの生成例
        let url = NSURL(string : cards[index].image_url);
        draggableView.myDescription = cards[index].description
        
        let imageData = NSData(contentsOfURL: url!)
        
        let yourImage:UIImage! = UIImage(data:imageData!)!
        
        draggableView.informationView.image = yourImage
        
        draggableView.url = cards[index].url
        
        //draggableView.informationView.contentMode = UIViewContentMode.ScaleAspectFill

        
      
        draggableView.backgroundColor = UIColor.whiteColor()
        draggableView.delegate = self
        return draggableView
    }
    
    func loadCards() {
        if (cards.count > 0) {
            let numLoadedCardsCap = ((cards.count > MAX_BUFFER_SIZE) ? MAX_BUFFER_SIZE : cards.count )
            
            for i in 0..<cards.count {
                let newCard: DraggableView = self.createDraggableViewWithDataAtIndex(i)
                allCards.addObject(newCard)
                if (i < numLoadedCardsCap) {
                    loadedCards.addObject(newCard)
                }
            }
            
            for i in 0..<loadedCards.count {
                if (i > 0) {
                    self.insertSubview(loadedCards.objectAtIndex(i) as! UIView, belowSubview: loadedCards.objectAtIndex(i-1) as! UIView)
                } else {
                    self.addSubview(loadedCards.objectAtIndex(i) as! UIView)
                }
                cardsLoadedIndex++
            }
        }
    }
    
    func cardSwipedLeft(card: UIView) {
        loadedCards.removeObjectAtIndex(0)
        if ( cardsLoadedIndex < allCards.count ) {
            loadedCards.addObject(allCards.objectAtIndex(cardsLoadedIndex))
            cardsLoadedIndex++
            self.insertSubview(loadedCards.objectAtIndex(MAX_BUFFER_SIZE-1) as! UIView, belowSubview: loadedCards.objectAtIndex(MAX_BUFFER_SIZE-2) as! UIView)
        }
    }
    
    func cardSwipedRight(card: UIView) {
        loadedCards.removeObjectAtIndex(0)
        if ( cardsLoadedIndex < allCards.count ) {
            loadedCards.addObject(allCards.objectAtIndex(cardsLoadedIndex))
            cardsLoadedIndex++
            self.insertSubview(loadedCards.objectAtIndex(MAX_BUFFER_SIZE-1) as! UIView, belowSubview: loadedCards.objectAtIndex(MAX_BUFFER_SIZE-2) as! UIView)
        }
    }
    

}