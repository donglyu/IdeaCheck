//
//  GlowLabel.swift
//  IdeaCheck
//
//  Created by donglyu on 2019/8/9.
//  Copyright © 2019 lydsnm. All rights reserved.
//

import UIKit

class GlowLabel: UILabel {

    override func drawText(in rect: CGRect) {
        let textShadowOffest = CGSize.zero
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        context?.setShadow(offset: textShadowOffest, blur: 14, color: UIColor.cyan.cgColor)
        super.drawText(in: rect)
        context?.restoreGState()
    }
}
