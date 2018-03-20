//fuck lol//
//  MCQdynamicVC.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-12-04.
//  Copyright © 2017 Katrine Rachitsky. All rights reserved.
//

import UIKit

// there should only be one instance of this class, and this is how you can get it
var mcqGraphVC : MCQGraphVC?

let barLabels             = ["L3","cervical","lumbar","pedicle","ufos"]
var barValues : [CGFloat] = [0   ,0         ,0       ,0        ,0     ]

class MCQGraphVC: UIViewController {

    @IBOutlet var graphView : GraphView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // set the view to the data of the case
    }
    
    @IBAction func changeToHalf() {
        for idx in 0 ..< barLabels.count {
            barValues[idx] = 0.5
        }
        graphView.setNeedsDisplay()
    }

}
