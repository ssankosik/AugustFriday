//
//  AGSpinerLayer.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 27/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//
//  Credit by Alaeddine M. on 11/1/15.



//MARK: - Imports
import UIKit



//MARK: - SpinerLayer
class AGSpinerLayer: CAShapeLayer {
  
  var spinnerColor = UIColor.white {
    didSet {
      strokeColor = spinnerColor.cgColor
    }
  }
  
  override init() {
    super.init()
    self.fillColor = nil
    self.strokeColor = spinnerColor.cgColor
    self.lineWidth = 2
    
    self.strokeEnd = 0.4
    self.isHidden = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(layer: Any) {
    super.init(layer: layer)
    self.fillColor = nil
    self.strokeColor = spinnerColor.cgColor
    self.lineWidth = 2
    
    self.strokeEnd = 0.4
    self.isHidden = true
  }
  
  func animation() {
    self.isHidden = false
    let rotate = CABasicAnimation(keyPath: "transform.rotation.z")
    rotate.fromValue = 0
    rotate.toValue = Double.pi * 2
    rotate.duration = 0.4
    rotate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    
    rotate.repeatCount = HUGE
    rotate.fillMode = kCAFillModeForwards
    rotate.isRemovedOnCompletion = false
    self.add(rotate, forKey: rotate.keyPath)
    
  }
  
  func setToFrame(_ frame: CGRect) {
    let radius:CGFloat = (frame.height / 2) * 0.5
    self.frame = CGRect(x: 0, y: 0, width: frame.height, height: frame.height)
    let center = CGPoint(x: frame.height / 2, y: bounds.center.y)
    let startAngle = 0 - Double.pi/2
    let endAngle = Double.pi * 2 - Double.pi/2
    let clockwise: Bool = true
    self.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: clockwise).cgPath
  }
  
  func stopAnimation() {
    self.isHidden = true
    self.removeAllAnimations()
  }
}
