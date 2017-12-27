//
//  Location.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-10-15.
//  Copyright © 2017 Spineducation. All rights reserved.
//

import Foundation

struct MedicalCase {
    var Name = "initialname"
//    let Prompts:[Prompt]
    var SurgicalCategory = "initialsurgicalcategory"
    var AnatomicalRegion = "initialanatomicalregion"
    
    func Describe(){
        print(Name)
        print(SurgicalCategory)
        print(AnatomicalRegion)
        
//        for element in Prompts {
//            element.Describe()
//        }
    }
    
//    enum CodingKeys : String, CodingKey {
//        case name
//        case abv = "alcohol_by_volume"
//        case brewery = "brewery_name"
//        case style
//    }
}
