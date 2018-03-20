//
//  GraphView.swift
//  Spineducation
//
//  Created by Christopher Kumar Anand on 2018-03-20.
//  Copyright © 2018 Katrine Rachitsky. All rights reserved.
//

import UIKit

class GraphView : UIView {

    override func draw(_ rect: CGRect) {
        let num = barLabels.count
        let numF = CGFloat(num)
        let viewFrame = self.frame
        let height = viewFrame.size.height
        let width = viewFrame.size.width
        
        let usableHeight = height
        
        let buttonSep = usableHeight/numF
        let buttonHeight = buttonSep * 0.8
        let buttonWidth = width / 2
        let labelWidth = buttonWidth - 8
        
        for idx in 0 ..< num {
            let i = CGFloat(idx)
            var rect = CGRect.init(x: width/2,
                                   y: buttonSep * i,
                                   width: buttonWidth * barValues[idx],
                                   height: buttonHeight)
            
            let path = UIBezierPath(rect: rect)
            UIColor(hue: i/numF, saturation: 1, brightness: 1, alpha: 1).setFill()
            path.fill()
            
            rect.origin.x = 0
            rect.origin.y = rect.origin.y + 0.4 * buttonHeight
            rect.size.width = labelWidth
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .right
            
            let attrs = [NSAttributedStringKey.font: UIFont(name:"HelveticaNeue", size:24)!,
                         NSAttributedStringKey.paragraphStyle: paragraphStyle]
            
            barLabels[idx].draw(with: rect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
            
        }
    }
}
