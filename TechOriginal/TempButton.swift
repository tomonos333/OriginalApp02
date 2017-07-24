//
//  TempButton.swift
//  TechOriginal
//
//  Created by 土井大平 on 2017/07/24.
//  Copyright © 2017年 tomo_nos. All rights reserved.
//

import UIKit

/// テンプレートボタン
class TempButton: UIButton {

    /// 選択時override
    override var isSelected: Bool {
        didSet {
            // ON/OFFで枠線を出して、選択を可視化
            if isSelected {
                layer.borderWidth = 5.0
                layer.borderColor = UIColor.green.cgColor
            } else {
                layer.borderWidth = 0.0
                layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
}
