//
//  ViewController.swift
//  PlotGame
//
//  Created by eunji park on 2015. 6. 28..
//  Copyright © 2015년 eunji park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var plotGameView:PlotGameView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //플롯 게임 뷰 생성
        plotGameView = PlotGameView.init()
        self.view.addSubview(plotGameView)
        
        let viewsDict = ["plotGameView":plotGameView]
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[plotGameView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[plotGameView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

