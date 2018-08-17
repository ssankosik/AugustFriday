//
//  UITableViewCell+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import UIKit

public extension UITableViewCell {

  public func setupDefault() {
    selectionStyle = .none
    backgroundColor = BaseColor.clear.color
    contentView.backgroundColor = BaseColor.clear.color
  }
  
}
