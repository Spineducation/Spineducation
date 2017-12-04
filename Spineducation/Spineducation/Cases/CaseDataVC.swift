//
//  CaseDataViewController.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-11-04.
//  Copyright © 2017 Spineducation. All rights reserved.
//

import UIKit

// CaseDataVC is a subclass of UIViewController
class CaseDataVC: UIViewController {
    
    @IBOutlet weak var Label1: UILabel!
    
    var caseDataToDisplay:MedicalCase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // Label1.text = "testingLabel"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // set the view to the data of the case
        if let data = caseDataToDisplay{
            
        }
    }
    
}

