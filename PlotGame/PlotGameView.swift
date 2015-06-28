//
//  PlotGameView.swift
//  sample
//
//  Created by eunji park on 2015. 6. 28..
//  Copyright © 2015년 eunji park. All rights reserved.
//

import Foundation
import UIKit

class PlotGameView :UIView{
    var resultLabelArray:[UILabel]!
    var cardDeck:[CardModel]!
    var basicTitle:[String]!
    
    let MAX_COUNT = 6
    
    init() {
        super.init(frame: CGRectZero)
        makeBasicTitle()
        makeCardDeck()
        makeLayout()
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func action(btn:UIButton) {
        let resultArray:[CardModel] = randomCard()
        
        for var i in 0...(resultArray.count - 1) {
            var cardName = resultArray[i].cardName;
            if (resultArray[i].cardDirection == CardDirection.Reverse) {
                cardName = "(역)" + cardName
            }
            
            resultLabelArray[i].attributedText = makeAttributedString(basicTitle[i], resultString: cardName)
        }
    }
    
    //MARK: 뷰의 기본 타이틀
    func makeBasicTitle() {
        basicTitle = []
        basicTitle.append("\n주인공의\n현재\n\n\n")
        basicTitle.append("\n주인공의\n가까운\n미래\n\n")
        basicTitle.append("\n주인공의\n과거\n\n\n")
        basicTitle.append("\n조력자\n\n\n")
        basicTitle.append("\n적\n\n\n")
        basicTitle.append("\n결말\n(목적)\n\n\n")
        
    }
    
    //MARK: 레이아웃 제작
    func makeLayout() {
        let randomButton = makeRandomButton()
        resultLabelArray = [];
        
        
        self.addSubview(randomButton)
        for var i in 0...(MAX_COUNT - 1) {
            resultLabelArray.append(makeResultLabel(basicTitle[i]))
            self.addSubview(resultLabelArray[i]);
        }
        
        let viewsDict = ["randomButton":randomButton,
            "resultLabel1":resultLabelArray[0],
            "resultLabel2":resultLabelArray[1],
            "resultLabel3":resultLabelArray[2],
            "resultLabel4":resultLabelArray[3],
            "resultLabel5":resultLabelArray[4],
            "resultLabel6":resultLabelArray[5]]
        
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[randomButton(120)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[randomButton(40)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        self.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[resultLabel3(resultLabel1)]-5-[resultLabel1(resultLabel3)]-5-[resultLabel2(resultLabel3)]-5-[resultLabel6(resultLabel3)]-15-|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: nil, views: viewsDict))
        self.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("V:[resultLabel4(resultLabel2)]-5-[resultLabel2]-5-[resultLabel5(resultLabel2)]", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: viewsDict))
        self.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("H:[resultLabel4(resultLabel3)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        self.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("H:[resultLabel5(resultLabel3)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        self.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("V:[resultLabel1(resultLabel2)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        self.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("V:[resultLabel2(resultLabel2)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        self.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("V:[resultLabel3(resultLabel2)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        self.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("V:[resultLabel6(resultLabel2)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        
        
        self.addConstraint(NSLayoutConstraint(item: randomButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: randomButton, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -70))
        self.addConstraint(NSLayoutConstraint(item: resultLabelArray[3], attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 50))
        
    }
    
    func makeCardDeck() {
        let cardNameArray:[String] = ["의사", "청초", "이성", "질서", "지혜", "서약", "선량", "절도", "성실", "생명", "관용", "해방", "조화", "창조", "신뢰", "공식", "변화", "결합", "엄격", "용기", "행운", "비호", "치유", "지애"]
        
        cardDeck = [];
        
        for var i in 0...(cardNameArray.count - 1) {
            let cardModel = CardModel.init(cardName:cardNameArray[i], cardNum:i)
            cardDeck.append(cardModel)
        }
    }
    
    func makeRandomButton()->UIButton
    {
        let button =  UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(100, 100, 100, 50)
        button.backgroundColor = UIColor.whiteColor()
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.grayColor().CGColor
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.setTitle("카드 구성하기!", forState: UIControlState.Normal)
        button.addTarget(self, action: "action:", forControlEvents: UIControlEvents.TouchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func makeResultLabel(string:String)->UILabel
    {
        let label = UILabel(frame: CGRectZero)
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.grayColor()
        label.backgroundColor = UIColor.whiteColor()
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.grayColor().CGColor
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.text = string
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }
    
    func makeAttributedString(titleString:String, resultString:String)->NSAttributedString
    {
        let string = titleString + resultString + "\n"
        
        let attributedString = NSMutableAttributedString(string: string)
        let theRange:NSRange = (string as NSString).rangeOfString(resultString)
        let attributes = [NSForegroundColorAttributeName: UIColor.brownColor(), NSFontAttributeName: UIFont.systemFontOfSize(14)]
        
        attributedString.addAttributes(attributes, range: theRange)
        return attributedString
    }
    
    func randomCard()->[CardModel] {
        var pickedCard:[CardModel] = []
        
        while(pickedCard.count < 6) {
            let randomIndex:Int = Int(arc4random_uniform(UInt32(cardDeck.count)))
            
            if (isSelected(randomIndex, deck: pickedCard)) {
                continue
            }
            let cardModel = CardModel.init(cardName: cardDeck[randomIndex].cardName, cardNum: cardDeck[randomIndex].cardNum)
            
            let direction = arc4random_uniform(2)
            if (direction == 1) {
                cardModel.cardDirection = CardDirection.Reverse
            }
            
            pickedCard.append(cardModel)
            
            
        }
        return pickedCard
    }
    
    func isSelected(index:Int, deck:[CardModel]) -> Bool {
        let compareCardNum:Int = cardDeck[index].cardNum
        
        if (deck.count == 0) {
            return false;
        }
        
        for var i in 0...(deck.count - 1) {
            let cardNum:Int = deck[i].cardNum
            if (cardNum == compareCardNum) {
                return true;
            }
        }
        return false;
    }
}