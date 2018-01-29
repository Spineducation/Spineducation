//
//  Plane.swift
//  Spineducation
//
//  Created by Katrine Rachitsky on 2018-01-28.
//  Copyright © 2018 Katrine Rachitsky. All rights reserved.
//

import Foundation
import UIKit
import ARKit

class Plane: SCNNode {
    init(anchor: ARPlaneAnchor){
        super.init()
        let width = CGFloat(anchor.extent.x)
        let length = CGFloat(anchor.extent.z)
        let planeHeight = 0.01 as CGFloat
        //self.planeGeometry = SCNBox THIS DOESN'T WORK WHY :'(
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
