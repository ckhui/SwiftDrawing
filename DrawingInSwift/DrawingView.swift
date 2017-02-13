//
//  DrawingView.swift
//  DrawingInSwift
//
//  Created by NEXTAcademy on 2/13/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    
    
    var lines  : [Line] = []
    var lastPoint : CGPoint!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.black
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastPoint = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let newPoint = touches.first?.location(in: self)
        else { return }
        lines.append(Line(start: lastPoint, end: newPoint))
        lastPoint = newPoint
        
        self.setNeedsDisplay()
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
        
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.red.cgColor)
        
        for line in lines {
            context?.move(to: line.start)
            context?.addLine(to: line.end)
        }
        
        context?.strokePath()
        
        
    }
 

}
