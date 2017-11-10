//
//  History.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-11-09.
//  Copyright © 2017 Katrine Rachitsky. All rights reserved.
//

import Foundation

struct Prompt {
    var promptType:String
    var Text:String
    var mcqs = [mcq]()
    
    func printMCQs(){
        for temp_mcq in mcqs {
            print(temp_mcq.Question)
        }
    }
    
}
