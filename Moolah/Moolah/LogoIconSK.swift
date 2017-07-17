//
//  LogoIconSK.swift
//  Moolah
//
//  Created by Arvin San Miguel on 7/12/17.
//  Copyright © 2017 Appr1sing Studios. All rights reserved.
//

import UIKit

public class LogoIconSK : NSObject {
    
    //// Drawing Methods
    
    public dynamic class func drawCanvas(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 486, height: 486), resizing: ResizingBehavior = .aspectFit) {
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 486, height: 486), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 486, y: resizedFrame.height / 486)
        
        
        //// Color Declarations
        let gradient3Color = UIColor(red: 0.463, green: 0.815, blue: 0.943, alpha: 1.000)
        let gradient4Color = UIColor(red: 0.437, green: 0.809, blue: 0.478, alpha: 1.000)
        let gradient4Color2 = UIColor(red: 0.997, green: 0.997, blue: 0.997, alpha: 1.000)
        let gradient3Color2 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        let gradient5Color = UIColor(red: 0.439, green: 0.808, blue: 0.478, alpha: 1.000)
        let gradient5Color2 = UIColor(red: 0.576, green: 0.851, blue: 0.953, alpha: 1.000)
        
        //// Gradient Declarations
        let gradient3 = CGGradient(colorsSpace: nil, colors: [gradient3Color2.cgColor, gradient3Color2.blended(withFraction: 0.5, of: gradient3Color).cgColor, gradient3Color.cgColor] as CFArray, locations: [0, 0.21, 1])!
        let gradient4 = CGGradient(colorsSpace: nil, colors: [gradient4Color.cgColor, gradient4Color2.cgColor] as CFArray, locations: [0, 1])!
        let gradient5 = CGGradient(colorsSpace: nil, colors: [gradient5Color.cgColor, gradient5Color2.cgColor] as CFArray, locations: [0, 1])!
        
        //// Group 3
        //// Group 2
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 213.02, y: 234.1))
        bezierPath.addLine(to: CGPoint(x: 213.02, y: 248.9))
        bezierPath.addCurve(to: CGPoint(x: 192.51, y: 267), controlPoint1: CGPoint(x: 213.02, y: 259.03), controlPoint2: CGPoint(x: 203.73, y: 267))
        bezierPath.addCurve(to: CGPoint(x: 172, y: 248.9), controlPoint1: CGPoint(x: 181.29, y: 267), controlPoint2: CGPoint(x: 172, y: 259.03))
        bezierPath.addLine(to: CGPoint(x: 172, y: 234.1))
        bezierPath.addCurve(to: CGPoint(x: 172.65, y: 229.56), controlPoint1: CGPoint(x: 172, y: 232.55), controlPoint2: CGPoint(x: 172.22, y: 231.03))
        bezierPath.addCurve(to: CGPoint(x: 174.84, y: 224.89), controlPoint1: CGPoint(x: 173.13, y: 227.91), controlPoint2: CGPoint(x: 173.87, y: 226.34))
        bezierPath.addCurve(to: CGPoint(x: 186.72, y: 216.73), controlPoint1: CGPoint(x: 177.49, y: 220.93), controlPoint2: CGPoint(x: 181.75, y: 218.02))
        bezierPath.addLine(to: CGPoint(x: 186.82, y: 216.7))
        bezierPath.addCurve(to: CGPoint(x: 192.51, y: 216), controlPoint1: CGPoint(x: 188.66, y: 216.24), controlPoint2: CGPoint(x: 190.57, y: 216))
        bezierPath.addCurve(to: CGPoint(x: 213.02, y: 234.1), controlPoint1: CGPoint(x: 203.73, y: 216), controlPoint2: CGPoint(x: 213.02, y: 223.97))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 206.51, y: 234.1))
        bezierPath.addCurve(to: CGPoint(x: 192.51, y: 222.58), controlPoint1: CGPoint(x: 206.51, y: 227.87), controlPoint2: CGPoint(x: 200.35, y: 222.58))
        bezierPath.addCurve(to: CGPoint(x: 188.41, y: 223.08), controlPoint1: CGPoint(x: 191.1, y: 222.58), controlPoint2: CGPoint(x: 189.73, y: 222.75))
        bezierPath.addLine(to: CGPoint(x: 188.33, y: 223.11))
        bezierPath.addCurve(to: CGPoint(x: 180.23, y: 228.58), controlPoint1: CGPoint(x: 184.87, y: 224), controlPoint2: CGPoint(x: 181.97, y: 225.99))
        bezierPath.addCurve(to: CGPoint(x: 178.89, y: 231.42), controlPoint1: CGPoint(x: 179.63, y: 229.47), controlPoint2: CGPoint(x: 179.18, y: 230.43))
        bezierPath.addCurve(to: CGPoint(x: 178.51, y: 234.1), controlPoint1: CGPoint(x: 178.64, y: 232.29), controlPoint2: CGPoint(x: 178.51, y: 233.19))
        bezierPath.addLine(to: CGPoint(x: 178.51, y: 248.9))
        bezierPath.addCurve(to: CGPoint(x: 192.51, y: 260.42), controlPoint1: CGPoint(x: 178.51, y: 255.13), controlPoint2: CGPoint(x: 184.67, y: 260.42))
        bezierPath.addCurve(to: CGPoint(x: 206.51, y: 248.9), controlPoint1: CGPoint(x: 200.35, y: 260.42), controlPoint2: CGPoint(x: 206.51, y: 255.13))
        bezierPath.addLine(to: CGPoint(x: 206.51, y: 234.1))
        bezierPath.close()
        context.saveGState()
        bezierPath.addClip()
        context.drawLinearGradient(gradient3,
                                   start: CGPoint(x: 192.51, y: 241.5),
                                   end: CGPoint(x: 184.13, y: 252.29),
                                   options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        context.restoreGState()
        
        
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 256, y: 234.1))
        bezier2Path.addLine(to: CGPoint(x: 256, y: 248.9))
        bezier2Path.addCurve(to: CGPoint(x: 235.49, y: 267), controlPoint1: CGPoint(x: 256, y: 259.03), controlPoint2: CGPoint(x: 246.71, y: 267))
        bezier2Path.addCurve(to: CGPoint(x: 214.98, y: 248.9), controlPoint1: CGPoint(x: 224.27, y: 267), controlPoint2: CGPoint(x: 214.98, y: 259.03))
        bezier2Path.addLine(to: CGPoint(x: 214.98, y: 234.1))
        bezier2Path.addCurve(to: CGPoint(x: 215.62, y: 229.56), controlPoint1: CGPoint(x: 214.98, y: 232.55), controlPoint2: CGPoint(x: 215.2, y: 231.03))
        bezier2Path.addCurve(to: CGPoint(x: 217.82, y: 224.89), controlPoint1: CGPoint(x: 216.11, y: 227.91), controlPoint2: CGPoint(x: 216.85, y: 226.34))
        bezier2Path.addCurve(to: CGPoint(x: 229.7, y: 216.73), controlPoint1: CGPoint(x: 220.47, y: 220.93), controlPoint2: CGPoint(x: 224.72, y: 218.02))
        bezier2Path.addLine(to: CGPoint(x: 229.8, y: 216.7))
        bezier2Path.addCurve(to: CGPoint(x: 235.49, y: 216), controlPoint1: CGPoint(x: 231.64, y: 216.24), controlPoint2: CGPoint(x: 233.55, y: 216))
        bezier2Path.addCurve(to: CGPoint(x: 256, y: 234.1), controlPoint1: CGPoint(x: 246.71, y: 216), controlPoint2: CGPoint(x: 256, y: 223.97))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: 249.49, y: 234.1))
        bezier2Path.addCurve(to: CGPoint(x: 235.49, y: 222.58), controlPoint1: CGPoint(x: 249.49, y: 227.87), controlPoint2: CGPoint(x: 243.33, y: 222.58))
        bezier2Path.addCurve(to: CGPoint(x: 231.39, y: 223.08), controlPoint1: CGPoint(x: 234.08, y: 222.58), controlPoint2: CGPoint(x: 232.71, y: 222.75))
        bezier2Path.addLine(to: CGPoint(x: 231.3, y: 223.11))
        bezier2Path.addCurve(to: CGPoint(x: 223.21, y: 228.58), controlPoint1: CGPoint(x: 227.84, y: 224), controlPoint2: CGPoint(x: 224.94, y: 225.99))
        bezier2Path.addCurve(to: CGPoint(x: 221.87, y: 231.42), controlPoint1: CGPoint(x: 222.61, y: 229.47), controlPoint2: CGPoint(x: 222.16, y: 230.43))
        bezier2Path.addCurve(to: CGPoint(x: 221.49, y: 234.1), controlPoint1: CGPoint(x: 221.62, y: 232.29), controlPoint2: CGPoint(x: 221.49, y: 233.19))
        bezier2Path.addLine(to: CGPoint(x: 221.49, y: 248.9))
        bezier2Path.addCurve(to: CGPoint(x: 235.49, y: 260.42), controlPoint1: CGPoint(x: 221.49, y: 255.13), controlPoint2: CGPoint(x: 227.65, y: 260.42))
        bezier2Path.addCurve(to: CGPoint(x: 249.49, y: 248.9), controlPoint1: CGPoint(x: 243.33, y: 260.42), controlPoint2: CGPoint(x: 249.49, y: 255.13))
        bezier2Path.addLine(to: CGPoint(x: 249.49, y: 234.1))
        bezier2Path.close()
        context.saveGState()
        bezier2Path.addClip()
        context.drawLinearGradient(gradient4,
                                   start: CGPoint(x: 243.58, y: 230.74),
                                   end: CGPoint(x: 235.49, y: 241.5),
                                   options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        context.restoreGState()
        
        
        //// Group
        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: 192.67, y: 241.5))
        bezier6Path.addLine(to: CGPoint(x: 192.67, y: 236.5))
        bezier6Path.addLine(to: CGPoint(x: 187.5, y: 241.5))
        bezier6Path.addLine(to: CGPoint(x: 192.67, y: 246.5))
        bezier6Path.addLine(to: CGPoint(x: 192.67, y: 241.5))
        bezier6Path.close()
        gradient5Color.setFill()
        bezier6Path.fill()
        
        
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 235.33, y: 241.5))
        bezier3Path.addLine(to: CGPoint(x: 235.33, y: 246.5))
        bezier3Path.addLine(to: CGPoint(x: 240.5, y: 241.5))
        bezier3Path.addLine(to: CGPoint(x: 235.33, y: 236.5))
        bezier3Path.addLine(to: CGPoint(x: 235.33, y: 241.5))
        bezier3Path.close()
        gradient3Color.setFill()
        bezier3Path.fill()
        
        
        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: 192.67, y: 241.5))
        bezier4Path.addCurve(to: CGPoint(x: 235.33, y: 241.5), controlPoint1: CGPoint(x: 192.02, y: 241.5), controlPoint2: CGPoint(x: 235.33, y: 241.5))
        context.saveGState()
        bezier4Path.addClip()
        context.drawLinearGradient(gradient5, start: CGPoint(x: 214, y: 241.5), end: CGPoint(x: 214, y: 241.5), options: [])
        context.restoreGState()
        UIColor.white.setStroke()
        bezier4Path.lineWidth = 3
        bezier4Path.stroke()
        
        
        //// Text Drawing
        let textRect = CGRect(x: 107, y: 195, width: 69, height: 91)
        let textTextContent = "M"
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .center
        let textFontAttributes = [NSFontAttributeName: UIFont(name: "DINAlternate-Bold", size: 70)!, NSForegroundColorAttributeName: UIColor.white, NSParagraphStyleAttributeName: textStyle]
        
        let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: textRect)
        textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
        context.restoreGState()
        
        
        //// Text 2 Drawing
        let text2Rect = CGRect(x: 259, y: 216, width: 133, height: 51)
        let text2TextContent = "LAH"
        let text2Style = NSMutableParagraphStyle()
        text2Style.alignment = .left
        let text2FontAttributes = [NSFontAttributeName: UIFont(name: "DINAlternate-Bold", size: 70)!, NSForegroundColorAttributeName: UIColor.white, NSParagraphStyleAttributeName: text2Style]
        
        let text2TextHeight: CGFloat = text2TextContent.boundingRect(with: CGSize(width: text2Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text2FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text2Rect)
        text2TextContent.draw(in: CGRect(x: text2Rect.minX, y: text2Rect.minY + (text2Rect.height - text2TextHeight) / 2, width: text2Rect.width, height: text2TextHeight), withAttributes: text2FontAttributes)
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



extension UIColor {
    func blended(withFraction fraction: CGFloat, of color: UIColor) -> UIColor {
        var r1: CGFloat = 1, g1: CGFloat = 1, b1: CGFloat = 1, a1: CGFloat = 1
        var r2: CGFloat = 1, g2: CGFloat = 1, b2: CGFloat = 1, a2: CGFloat = 1
        
        self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        return UIColor(red: r1 * (1 - fraction) + r2 * fraction,
                       green: g1 * (1 - fraction) + g2 * fraction,
                       blue: b1 * (1 - fraction) + b2 * fraction,
                       alpha: a1 * (1 - fraction) + a2 * fraction);
    }
}
