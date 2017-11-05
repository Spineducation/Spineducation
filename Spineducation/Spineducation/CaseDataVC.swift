//
//  CaseDataViewController.swift
//  SpinePHPtesting
//
//  Created by Randa Mohsen on 2017-11-04.
//  Copyright © 2017 Spineducation. All rights reserved.
//

import UIKit

class CaseDataVC: UIViewController {
    
    var caseDataToDisplay:MedicalCase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

