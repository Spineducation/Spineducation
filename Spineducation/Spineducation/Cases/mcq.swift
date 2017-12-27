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
    var SurgicalCategories:String
    var SurgicalCategories_list:[Int]
    var AnatomicalRegions:String
    var AnatomicalRegions_list:[Int]

    func Describe(){
        print(Question)
        print("[" + String(AnswerA) + "]" + OptionA)
        print("[" + String(AnswerB) + "]" + OptionB)
        print("[" + String(AnswerC) + "]" + OptionC)
        print("[" + String(AnswerD) + "]" + OptionD)
    
        print(FutherDetail)
        print(SurgicalCategories)
        print(AnatomicalRegions)
    }
    
    mutating func UnwrapSurgicalCategories(){
        SurgicalCategories.remove(at: SurgicalCategories.startIndex)
        SurgicalCategories.remove(at: SurgicalCategories.endIndex)

        let tempList = SurgicalCategories.split(separator: ",")
        
        for value in tempList {
            SurgicalCategories_list.append(Int(value)!)
        }
    }
    
    mutating func UnwrapAnatomicalRegions(){
        AnatomicalRegions.remove(at: AnatomicalRegions.startIndex)
        AnatomicalRegions.remove(at: AnatomicalRegions.endIndex)

        let tempList = AnatomicalRegions.split(separator: ",")
        
        for value in tempList {
            AnatomicalRegions_list.append(Int(value)!)
        }
    }
    
    func FilterBySurgicalCategory(inputMCQ: [mcq], inputSurgicalCategory: Int) -> [mcq] {
        var outputMCQ:[mcq]
        outputMCQ = []
        
        for mcq in inputMCQ {
            for value in SurgicalCategories_list {
                if (value == inputSurgicalCategory) {
                    outputMCQ.append(mcq)
                    break
                }
            }
        }
        
        return outputMCQ
    }
    
    func FilterByAnatomicalRegion(inputMCQ: [mcq], inputAnatomicalRegion: Int)-> [mcq] {
        var outputMCQ:[mcq]
        outputMCQ = []
        
        for mcq in inputMCQ {
            for value in AnatomicalRegions_list {
                if (value == inputAnatomicalRegion) {
                    outputMCQ.append(mcq)
                    break
                }
            }
        }
        
        return outputMCQ
    }
}
