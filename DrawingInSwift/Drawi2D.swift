//
//  Drawi2D.swift
//  DrawingInSwift
//
//  Created by NEXTAcademy on 2/13/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class Drawi2D: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        
        //Drawing a Line  using Quartz 2D
        //1. obtain graphic context
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        
        //2. create color reference
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let components: [CGFloat] = [0.0, 0.0, 1.0, 1.0]
        let color = CGColor(colorSpace: colorSpace, components: components)
        
        context?.setStrokeColor(color!)
        //or 2. can be replace by
        //context?.setStrokeColor(UIColor.blue.cgColor)
        
        //3. move to where to start
        context?.move(to: CGPoint(x: 30, y: 30))
        
        //4. drawing (line)
        context?.addLine(to: CGPoint(x: 300, y: 400))

        context?.strokePath()
        
        
        //5. drawing (path)
        context?.setLineWidth(1.0)
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.move(to: CGPoint(x:100, y: 100))
        context?.addLine(to: CGPoint(x: 150, y: 150))
        context?.addLine(to: CGPoint(x: 100, y: 200))
        context?.addLine(to: CGPoint(x: 50, y: 150))
        context?.addLine(to: CGPoint(x: 100, y: 100))
        context?.strokePath()
        
        //6. drawing (rect)
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.orange.cgColor)
        let rectangle = CGRect(x: 160,y: 170,width: 200,height: 80)
        context?.addRect(rectangle)
        context?.strokePath()
        
        
        //7. drawing ellipse or circle
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.purple.cgColor)
        let rectangle2 = CGRect(x: 160,y: 50,width: 200,height: 80)
        context?.addEllipse(in: rectangle2)
        context?.strokePath()
        
        //8.fill path with color
        context?.move(to: CGPoint(x: 100, y: 50))
        context?.addLine(to: CGPoint(x: 150, y: 100))
        context?.addLine(to: CGPoint(x: 100, y: 150))
        context?.addLine(to: CGPoint(x: 50, y: 100))
        context?.addLine(to: CGPoint(x: 100, y: 50))
        context?.setFillColor(UIColor.red.cgColor)
        context?.fillPath()
        
        //9. fill with border
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let rectangle3 = CGRect(x: 160,y: 270,width: 200,height: 80)
        context?.addRect(rectangle3)
        context?.strokePath()
        context?.setFillColor(UIColor.green.cgColor)
        context?.fill(rectangle3)
        
        
        //10.  drawing (arc)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.move(to: CGPoint(x: 50, y: 300))
        context?.addArc(tangent1End: CGPoint(x: 100, y: 200),
                        tangent2End: CGPoint(x: 300, y: 200), radius: 50)
        context?.strokePath()
        
        //11. drawing (Cubic Bézier Curve)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.move(to: CGPoint(x: 10, y: 10))
        context?.addCurve(to: CGPoint(x: 0, y: 50),
                          control1: CGPoint(x: 300, y: 250),
                          control2: CGPoint(x: 300, y: 40))
        context?.strokePath()
    
        //12. drawing (Quadratic Bézier Curve)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.move(to: CGPoint(x: 10, y: 200))
        context?.addQuadCurve(to: CGPoint(x: 300, y: 200),
                              control: CGPoint(x: 150, y: 10))
        context?.strokePath()
        
        
        //13. Dashed Line Drawing
        /*
         context – The graphics context of the view on which the drawing is to take place
         phase - A floating point value that specifies how far into the dash pattern the line starts
         lengths – An array containing values for the lengths of the painted and unpainted sections of the line. For example an array containing 5 and 6 would cycle through 5 painted unit spaces followed by 6 unpainted unit spaces.
         count – A count of the number of items in the lengths array
        */
        
        context?.setLineWidth(20.0)
        context?.setStrokeColor(UIColor.brown.cgColor)
        let dashArray:[CGFloat] = [2,6,4,2]
        context?.setLineDash(phase: 3, lengths: dashArray)
        context?.move(to: CGPoint(x: 10, y: 200))
        context?.addQuadCurve(to: CGPoint(x: 300, y: 200),
                              control: CGPoint(x: 150, y: 10))
        context?.strokePath()
        
        
        //14. Drawing Shadows
        // setShadow, offset values for the position of the shadow relative to the shape for which the shadow is being drawn and a value specifying the degree of blurring required for the shadow effect.
        let myShadowOffset = CGSize (width: -10,  height: 15)
        context?.setLineDash(phase: 0, lengths: [])
        context?.saveGState()
        context?.setShadow (offset: myShadowOffset, blur: 5)
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let rectangle4 = CGRect(x: 60,y: 370,width: 200,height: 80)
        context?.addEllipse(in: rectangle4)
        context?.strokePath()
        context?.restoreGState()
        
    }
 

}
