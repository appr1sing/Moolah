//
//  AddIconSK.swift
//  Moolah
//
//  Created by Arvin San Miguel on 6/30/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

public class AddIconSK : NSObject {
    
    //// Drawing Methods
    
    public dynamic class func drawAddButton(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 26, height: 27), resizing: ResizingBehavior = .aspectFit) {
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 26, height: 27), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 26, y: resizedFrame.height / 27)
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 13.5, y: 5.5))
        bezierPath.addCurve(to: CGPoint(x: 13.5, y: 19.5), controlPoint1: CGPoint(x: 13.5, y: 19.5), controlPoint2: CGPoint(x: 13.5, y: 19.5))
        UIColor.white.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        
        
        //// Bezier 2 Drawing
        context.saveGState()
        context.translateBy(x: 6.5, y: 12.5)
        context.rotate(by: -90 * CGFloat.pi/180)
        
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 0, y: 0))
        bezier2Path.addCurve(to: CGPoint(x: 0, y: 14), controlPoint1: CGPoint(x: 0, y: 14), controlPoint2: CGPoint(x: 0, y: 14))
        UIColor.white.setStroke()
        bezier2Path.lineWidth = 1
        bezier2Path.stroke()
        
        context.restoreGState()
        
        context.restoreGState()
        
    }
    
    
    
    
    @objc public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.
        
        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }
            
            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)
            
            switch self {
            case .aspectFit:
                scales.width = min(scales.width, scales.height)
                scales.height = scales.width
            case .aspectFill:
                scales.width = max(scales.width, scales.height)
                scales.height = scales.width
            case .stretch:
                break
            case .center:
                scales.width = 1
                scales.height = 1
            }
            
            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
