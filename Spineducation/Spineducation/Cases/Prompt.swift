//
//  History.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-11-09.
//  Copyright © 2017 Katrine Rachitsky. All rights reserved.
//

import Foundation

struct Prompt {
    var PromptType:String
    var Text:String
    var Mcqs = [mcq]()
    
    func Describe(){
        print(PromptType)
        print(Text)
        
        for element in Mcqs {
            element.Describe()
        }
    }
    
}
