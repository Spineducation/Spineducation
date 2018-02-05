//
//  TextNode.swift
//  Spineducation
//
//  Created by Katrine Rachitsky on 2018-02-04.
//  Copyright © 2018 Katrine Rachitsky. All rights reserved.
//


//FIGURE OUT AND USE LATER WHEN WE PERFECT THE INSTRUCTIONs
import Foundation
import SceneKit

class TextNode: SCNNode {
    private let extrusionDepth: CGFloat = 0.01                  // Text depth
    private let textNodeScale = SCNVector3Make(0.1, 0.1, 0.1)   // Scale applied to node
    private var text: SCNText?
    
    public var color = UIColor.white {
        didSet {
            text?.firstMaterial?.diffuse.contents = color
        }
    }
    
    public var font: UIFont? = UIFont.systemFont(ofSize: 0.1) {
        didSet {
            text?.font = UIFont(name: "Times New Roman", size: 0.001)
        }
    }
    
    public var alignmentMode = kCAAlignmentCenter {
        didSet {
            text?.alignmentMode = kCAAlignmentCenter
        }
    }
    
    init(_ string: String) {
        super.init()
        let constraints = SCNBillboardConstraint()
        let node = SCNNode()
        let max, min: SCNVector3
        let tx, ty, tz: Float
        
        constraints.freeAxes = .Y
        
        text = SCNText(string: string, extrusionDepth: extrusionDepth)
        text?.alignmentMode = alignmentMode
        text?.firstMaterial?.diffuse.contents = color
        text?.chamferRadius = extrusionDepth
        text?.font = font
        
        max = text!.boundingBox.max
        min = text!.boundingBox.min
        
        tx = (max.x - min.x) / 2.0
        ty = min.y
        tz = Float(extrusionDepth) / 2.0
        
        node.geometry = text
        node.scale = scale
        node.pivot = SCNMatrix4MakeTranslation(tx, ty, tz)
        
        self.addChildNode(node)
        
        self.constraints = [SCNBillboardConstraint()]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
