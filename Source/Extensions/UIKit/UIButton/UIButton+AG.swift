//
//  UIButton+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 25/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import UIKit

public extension UIButton {
  
  @available(iOS, deprecated, message: "Use func UIBarButtonItem.createNavBarButton")
  public class func createNavButton(_ img: UIImage,
                                    isCompact: Bool = false,
                                    horizontalAlignment: UIControlContentHorizontalAlignment? = nil ,
                                    target: Any,
                                    action: Selector) -> UIButton {
    let btn = UIButton(type: .custom)
    btn.setImage(img, for: .normal)
    btn.setImage(img.overlay(color: BaseColor.white.color), for: .highlighted)
    btn.setImage(img.overlay(color: BaseColor.white_four.color), for: .disabled)
    let width: CGFloat = isCompact ? 24 : 44
    btn.frame = CGRect(x: 0, y: 0, width: width, height: 44)
    btn.contentMode = .scaleAspectFit
    if let alignment = horizontalAlignment {
      btn.contentHorizontalAlignment = alignment
    }
    btn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    btn.addTarget(target, action: action, for: .touchUpInside)
    return btn
  }
  
}

public extension UIBarButtonItem {
  
  public class func createNavBarButton(_ image: AGAsset,
                                       isCompact: Bool = false,
                                       horizontalAlignment: UIControlContentHorizontalAlignment? = nil,
                                       target: Any,
                                       action: Selector) -> UIBarButtonItem {
    let btn = UIButton(type: .custom)
    btn.setImage(image.image, for: .normal)
    btn.setImage(image.image.overlay(color: BaseColor.white.color), for: .highlighted)
    btn.setImage(image.image.overlay(color: BaseColor.white_four.color), for: .disabled)
    let width: CGFloat = isCompact ? 24 : 44
    btn.frame = CGRect(x: 0, y: 0, width: width, height: 44)
    btn.contentMode = .scaleAspectFit
    if let alignment = horizontalAlignment {
      btn.contentHorizontalAlignment = alignment
    }
    btn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    btn.addTarget(target, action: action, for: .touchUpInside)
    let bbtn = UIBarButtonItem(customView: btn)
    if #available(iOS 11, *) {
      bbtn.customView?.contentMode = .scaleAspectFit
      let width: CGFloat = isCompact ? 24 : 44
      bbtn.customView?.widthAnchor.constraint(equalToConstant: width).isActive = true
      bbtn.customView?.heightAnchor.constraint(equalToConstant: 44).isActive = true
    } else {
      
    }
    return bbtn
    
  }
  
  public class func createNavTitleImage(_ image: AGAsset,
                                        target: Any,
                                        action: Selector? = nil) -> UIImageView {
    let img = image.image
    let imgv = UIImageView(image: img)
    imgv.contentMode = .scaleAspectFill
    if let action = action {
      let gesture_tap = UITapGestureRecognizer(target: target, action: action)
      imgv.addGestureRecognizer(gesture_tap)
      imgv.isUserInteractionEnabled = true
    }
    return imgv
  }
  
  public class func createNavTitleView(_ view: UIView,
                                       target: Any,
                                       action: Selector? = nil) -> UIView {
    let view = view
    if let action = action {
      let gesture_tap = UITapGestureRecognizer(target: target, action: action)
      view.addGestureRecognizer(gesture_tap)
      view.isUserInteractionEnabled = true
    }
    return view
  }
  
}



//MARK: Animation
extension UIButton {
  
  func pulsate() {
    
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.2
    pulse.fromValue = 0.95
    pulse.toValue = 1.0
    pulse.autoreverses = true
    pulse.repeatCount = 2
    pulse.initialVelocity = 0.5
    pulse.damping = 1.0
    
    layer.add(pulse, forKey: "pulse")
  }
  
  func flash() {
    
    let flash = CABasicAnimation(keyPath: "opacity")
    flash.duration = 0.2
    flash.fromValue = 1
    flash.toValue = 0.1
    flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    flash.autoreverses = true
    flash.repeatCount = 3
    
    layer.add(flash, forKey: nil)
  }
  
  
  func shake() {
    
    let shake = CABasicAnimation(keyPath: "position")
    shake.duration = 0.05
    shake.repeatCount = 2
    shake.autoreverses = true
    
    let fromPoint = CGPoint(x: center.x - 5, y: center.y)
    let fromValue = NSValue(cgPoint: fromPoint)
    
    let toPoint = CGPoint(x: center.x + 5, y: center.y)
    let toValue = NSValue(cgPoint: toPoint)
    
    shake.fromValue = fromValue
    shake.toValue = toValue
    
    layer.add(shake, forKey: "position")
  }
}







