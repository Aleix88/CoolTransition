//
//  ViewController.swift
//  CoolTransition
//
//  Created by Aleix Baggerman on 6/9/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOfMarks = 3
    var markArray = [MarkView]()
    var markFrameManagement: MarkFrameManagement!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< numberOfMarks {
            let markView = MarkView(width: 50, height: 30, color: getRandomColor(), mainViewWidth: CGRectGetWidth(self.view.frame))
            markArray.append(markView)
            view.addSubview(markArray[i])
            MarkFrameManagement().setMarkView(markArray[i], index: i, mainViewHeight: CGRectGetHeight(view.frame))
            
        }
    
    }
    
    func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }

}

