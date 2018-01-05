//
//  SimpleMainViewController.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-11-04.
//  Copyright © 2017 Spineducation. All rights reserved.
//

import UIKit

class StudyMainPageVC: UIViewController {
    
    var ArrayOfCases = [MedicalCase]()
    let object = HardCodingCases()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ArrayOfCases = object.go()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let CategriesPage = segue.destination as! MCQcategoriesVC

        if segue.identifier == "GoToCases" {

//            CategriesPage. =
            
        } else if segue.identifier == "GoToMCQs" {
           
            let tempMCQcategoriesVC = segue.destination as! MCQcategoriesVC
//            tempMCQcategoriesVC.medicalCasee = ArrayOfMCQs

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

