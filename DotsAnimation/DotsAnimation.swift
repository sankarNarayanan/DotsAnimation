//
//  DotsAnimation.swift
//  DotsAnimation
//
//  Created by Sankar Narayanan on 4/1/15.
//  Copyright (c) 2015 Sankar Narayanan. All rights reserved.
//

import UIKit

var dots : UIView!
var cornerRadiusLocal : CGFloat!

extension UIViewController{
    
    public func startLoadingAnimation(rect:CGRect, dotsColor:UIColor, cornerRadius:CGFloat, animationColor:UIColor) -> (UIView){
        cornerRadiusLocal = cornerRadius
        dots = UIView(frame: rect)
        self.buildView(dotsColor,animationColor: animationColor)
        return dots
    }
    
    func stopLoadingAnimation() {
        for dot in dots.subviews as [UIView] {
            dot.transform = CGAffineTransformMakeScale(1, 1);
            dot.layer.removeAllAnimations()
        }
    }
    
    private func buildView(dotsColor:UIColor,animationColor:UIColor) {
        dots.layer.cornerRadius = dots.bounds.size.width/2;
        for subview in dots.subviews {
            subview.removeFromSuperview()
        }
        let numberDots = CGFloat(5)
        let width = (dots.bounds.size.width)/(numberDots+1)
        let margin = (dots.bounds.size.width - (width * numberDots)) / 1.3
        let dotDiameter = width/3
        var frame = CGRectMake(margin, dots.bounds.size.height/2 - dotDiameter/2, dotDiameter, dotDiameter);
        for i in 0...Int(numberDots-1) {
            var dot:UIView = UIView(frame:frame)
            dot.layer.cornerRadius = CGFloat(1)/2.0
            dot.layer.cornerRadius = cornerRadiusLocal;
            dot.backgroundColor = dotsColor
            dots.addSubview(dot)
            frame.origin.x += width
        }
        //self.view.addSubview(dots)
        var i:Int = 0
        for dot in dots.subviews as [UIView] {
            dot.transform = CGAffineTransformMakeScale(1.2, 1.2);
            let delay = 0.2*Double(i)
            UIView.animateWithDuration(Double(1), delay:delay, options: UIViewAnimationOptions.Repeat , animations: { () -> Void in
                dot.transform = CGAffineTransformMakeScale(1, 1);
                dot.backgroundColor = animationColor
                }, completion: { finished in
                    
            })
            i++;
        }
    }
    
}
