//
//  mcq.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-11-09.
//  Copyright © 2017 Katrine Rachitsky. All rights reserved.
//

import Foundation

struct mcq {
    var Question:String
    
    var OptionA:String
    var AnswerA:Bool
    
    var OptionB:String
    var AnswerB:Bool
    
    var OptionC:String
    var AnswerC:Bool
    
    var OptionD:String
    var AnswerD:Bool
    
    var FutherDetail:String
    var SurgicalCategory:String
    var AnatomicalRegion:String
    
    func Describe(){
        print(Question)
        print("[" + String(AnswerA) + "]" + OptionA)
        print("[" + String(AnswerB) + "]" + OptionB)
        print("[" + String(AnswerC) + "]" + OptionC)
        print("[" + String(AnswerD) + "]" + OptionD)
    
        print(FutherDetail)
        print(SurgicalCategory)
        print(AnatomicalRegion)
    }
}
