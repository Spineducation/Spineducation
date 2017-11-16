//
//  Location.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-10-15.
//  Copyright © 2017 Spineducation. All rights reserved.
//

import Foundation

struct MedicalCase {
    let Name:String
//    let Prompts:[Prompt]
    let SurgicalCategory:[String]?
    let AnatomicalRegion:[String]?
    
    func Describe(){
        print(Name)
        print(SurgicalCategory ?? "null")
        print(AnatomicalRegion ?? "null")
        
//        for element in Prompts {
//            element.Describe()
//        }
    }
}
