//
//  XibLoadable.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 18/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

protocol XibLoadable {
    var contentView: UIView! { get }
}

extension XibLoadable where Self: UIView {
    func initFromNib() {
        Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
