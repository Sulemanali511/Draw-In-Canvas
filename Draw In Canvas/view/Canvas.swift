//
//  Canvas.swift
//  Draw In Canvas
//
//  Created by hosam on 4/18/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    //variables
    var lines = [Line]()
     var strokeColor = UIColor.black
    var strokelineWidth: Float = 10
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
         lines.forEach { (linee) in
            context.setStrokeColor(linee.color.cgColor)
            context.setLineCap(.butt)
            context.setLineWidth(CGFloat(linee.width))
            for (i,p) in linee.points.enumerated() {
                if i == 0 {
                    context.move(to: p)
                }else {
                    context.addLine(to: p)
                }
            }
             context.strokePath()
        }
    }
    
    //MARK: -user methods
    
    func undo()  {
        _ = lines.popLast()
        setNeedsDisplay()
        
    }
    
    func clearAll()  {
        lines.removeAll()
        setNeedsDisplay()
    }
    
    func chosenColor(color: UIColor)  {
        strokeColor = color
    }
    
    func chosenLineWdth(width: Float)  {
        strokelineWidth = width
    }
    
    //TODO: -override methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(width: strokelineWidth, color: strokeColor, points: []))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {return}
        
       guard var lastLine = lines.popLast()  else  {return}
        lastLine.points.append(point)
        lines.append(lastLine)
        
        setNeedsDisplay()
    }
}
