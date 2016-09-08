//
//  MarkView.swift
//  CoolTransition
//
//  Created by Aleix Baggerman on 6/9/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

class MarkView: UIView {

    var bezierPath = UIBezierPath()
    //init
    var mainViewHeight: CGFloat!
    //View properties
    
    var x:CGFloat!
    var t:CGFloat!
    var cen:CGPoint = CGPoint(x: 0, y: 0)

    
    var markHeight: CGFloat!
    var markWidth: CGFloat!
    var yPositions = [CGFloat]()
    var markLayer = CAShapeLayer()
    var markColor: UIColor!
    
    var mainViewWidth:CGFloat!
    
    var panGesture: UIPanGestureRecognizer!
    
    init(width: CGFloat, height: CGFloat, color: UIColor, mainViewWidth: CGFloat) {
        super.init(frame: CGRect(x: 10, y: 10, width: width, height: height))
        self.markWidth = width
        self.markHeight = height
        self.markColor = color
        self.mainViewWidth = mainViewWidth
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        createBezierPath()
        createGesture()
        self.layer.addSublayer(markLayer)
    }
    
    func createBezierPath() {
        bezierPath.moveToPoint(CGPoint(x: 0, y: 0))
        bezierPath.addLineToPoint(CGPoint(x: markWidth*(3/4), y: 0))
        bezierPath.addLineToPoint(CGPoint(x: markWidth, y: markHeight/2))
        bezierPath.addLineToPoint(CGPoint(x: markWidth*(3/4), y: markHeight))
        bezierPath.addLineToPoint(CGPoint(x: 0, y: markHeight))
        markLayer.path = bezierPath.CGPath
        markLayer.fillColor = markColor.CGColor
        markLayer.strokeColor = UIColor.blackColor().CGColor
        markLayer.lineWidth = 2
    }
    
    func createGesture() {
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(configurePan(_:)))
        self.addGestureRecognizer(panGesture)
    }
    
    func configurePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(self)
        cen = CGPoint(x: cen.x + translation.x, y:self.center.y)
        
        sender.setTranslation(CGPointZero, inView: self)
        t = cen.x
        calculateRotateValue()
        self.transform = CGAffineTransformRotate(CGAffineTransformIdentity, x)
        
        if sender.state == .Ended {
            x = 0
            print(x)
            self.transform = CGAffineTransformRotate(CGAffineTransformIdentity, x)
            cen = CGPointZero
        }
    }
    
    func calculateRotateValue() {
    
        let number: CGFloat = mainViewWidth/2
        x = (1.56*t)/number
        print(x)
        if x >= 1.56 {
            x = 1.56
        }
        
        if x <= 0 {
            x = 0
        }
        
        
    }

}
