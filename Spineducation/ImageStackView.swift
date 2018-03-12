//
//  ImageStackView.swift
//  Spineducation
//
//  Created by Christopher Kumar Anand on 2018-03-12.
//  Copyright © 2018 Katrine Rachitsky. All rights reserved.
//

import UIKit

@IBDesignable class ImageStackView : UIView {
    
    // this is the workspace we will draw, set by the parent ViewController
    var images = [UIImage]()
    var numImages = 0
    var currentIndex = 0
    
    func setImages(_ images:[UIImage]) {
        self.images = images
        numImages = images.count
        if currentIndex >= numImages { currentIndex = numImages - 1}
        self.setNeedsDisplay()
    }

    func maybeSetImage(touch : UITouch) {
        let currentPoint = touch.location(in: self)
        let width = self.bounds.width
        var index = Int(currentPoint.x / width * CGFloat(numImages))
        // keep index in bounds
        if index < 0 { index = 0 }
        if index >= numImages { index = numImages - 1 }
        // change image if index changed
        if index != currentIndex {
            currentIndex = index
            self.setNeedsDisplay()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            maybeSetImage(touch: touch)
            print("touchesBegan at \(currentIndex)")
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            maybeSetImage(touch: touch)
            print("touchesMoved at \(currentIndex)")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            maybeSetImage(touch: touch)
            print("touchesEnded at \(currentIndex)")
        }
    }
    override func draw(_ rect: CGRect) {
        let theImage = images[currentIndex]
        theImage.draw(in: self.bounds)
    }
}

