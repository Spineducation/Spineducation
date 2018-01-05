//
//  CasesCategoriesVC.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2018-01-04.
//  Copyright © 2018 Katrine Rachitsky. All rights reserved.
//

import UIKit

class CasesCategoriesVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var SurgicalCategoryPicker: UIPickerView!
    @IBOutlet weak var AnatomicalRegionPicker: UIPickerView!
    
    var SurgicalCategoryOptions = ["All","Trauma", "Tumour", "Deformity", "Disease", "Infection", "Degenerative", "Pediatric", "Adult", "Random"]
    var AnatomicalRegionOptions = ["All","Lumbar", "Cervical", "Thoracic", "Sacral"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Connect data:
        self.SurgicalCategoryPicker.delegate = self
        self.SurgicalCategoryPicker.dataSource = self
        
        self.AnatomicalRegionPicker.delegate = self
        self.AnatomicalRegionPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == SurgicalCategoryPicker {
            return SurgicalCategoryOptions.count
            
        } else   {
            return AnatomicalRegionOptions.count
            
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == SurgicalCategoryPicker {
            return SurgicalCategoryOptions[row]
            
        } else   {
            return AnatomicalRegionOptions[row]
            
        }
    }

}
