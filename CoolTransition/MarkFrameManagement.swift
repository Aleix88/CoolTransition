//
//  MarkFrameManagement.swift
//  CoolTransition
//
//  Created by Aleix Baggerman on 7/9/16.
//  Copyright © 2016 Aleix Baggerman. All rights reserved.
//

import UIKit

class MarkFrameManagement {
    
    var markView:MarkView!
    var yPosition: CGFloat!
    var markPadding:CGFloat = 30
    var index: Int!
    var mainViewHeight: CGFloat!
    func setMarkView(markView: MarkView, index: Int, mainViewHeight: CGFloat) {
        self.markView = markView
        self.index = index
        self.mainViewHeight = mainViewHeight
        calculateYPosition()
        configureFrame()
    }
    
    func configureFrame() {
        markView.frame = CGRect(x: 0, y: yPosition, width: CGRectGetWidth(markView.frame), height: CGRectGetHeight(markView.frame))
    }
    
    func calculateYPosition() {
        let markSizeWithPadding = (markPadding * CGFloat(index+1)) + (CGRectGetHeight(markView.frame) * CGFloat(index+1))
        yPosition = mainViewHeight - markSizeWithPadding
    }
}
