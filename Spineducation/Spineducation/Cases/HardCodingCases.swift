//
//  HardCodingCases.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-12-26.
//  Copyright © 2017 Katrine Rachitsky. All rights reserved.
//

import Foundation

struct HardCodingCases {
    
    func go() -> [MedicalCase] {
        var caseArray = [MedicalCase]()
        var promptArray = [Prompt]()
        var mcqArray = [mcq]()
        var tempCase = MedicalCase ()
        var tempPrompt = Prompt (PromptType : "initial prompt type", Text: "initial text", Mcqs: mcqArray)
        var tempMCQ = mcq (Question: "", OptionA: "", AnswerA: false, OptionB: "", AnswerB: false, OptionC: "", AnswerC: false, OptionD: "", AnswerD: false, FutherDetail:"", SurgicalCategories:"", SurgicalCategories_list: [0], AnatomicalRegions: "", AnatomicalRegions_list: [0])
        
        tempCase.Name = "Case zero"
        
        caseArray.append(tempCase)
        
        tempCase.Name = "Case zero"
        
        tempPrompt.PromptType = "HISTORY"
        
        promptArray.append(tempPrompt)
        
        tempPrompt.PromptType = "PHYSICAL"
        
        promptArray.append(tempPrompt)
        
        tempPrompt.PromptType = "XR"
        
        tempMCQ.OptionA = "Select a diagnosis"
        tempMCQ.OptionA = "More imaging is needed"
        tempMCQ.AnswerB = false
        tempMCQ.OptionB = "Hangman fracture"
        tempMCQ.AnswerB = false
        tempMCQ.OptionC = "Odontoid fracture"
        tempMCQ.AnswerB = true
        tempMCQ.OptionD = "Unilateral facet jump"
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "Select a diagnosis"
        tempMCQ.OptionA = "More imaging is needed"
        tempMCQ.AnswerB = false
        tempMCQ.OptionB = "Hangman fracture"
        tempMCQ.AnswerB = false
        tempMCQ.OptionC = "Odontoid fracture"
        tempMCQ.AnswerB = true
        tempMCQ.OptionD = "Unilateral facet jump"
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        tempPrompt.Mcqs = mcqArray
        promptArray.append(tempPrompt)
        
        tempPrompt.PromptType = "MRI"
        
        
        tempMCQ.OptionA = "Select a diagnosis."
        tempMCQ.OptionA = "Spinal stenosis"
        tempMCQ.AnswerB = false
        tempMCQ.OptionB = "Cauda equina"
        tempMCQ.AnswerB = true
        tempMCQ.OptionC = "Degenerative scoliosis"
        tempMCQ.AnswerB = false
        tempMCQ.OptionD = "conus medullaris syndrome"
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "Select the most appropriate management"
        tempMCQ.OptionA = "L3-5 central decompression and posterolateral fusion"
        tempMCQ.AnswerB = false
        tempMCQ.OptionB = "L4-5 central decompression, posterolateral instrumented fusion of L4-5"
        tempMCQ.AnswerB = true
        tempMCQ.OptionC = "L4-5 transforaminal interbody fusion"
        tempMCQ.AnswerB = false
        tempMCQ.OptionD = "L3-5 central decompression with posterior lumbar interbody fusion"
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "During the procedure a CSF leak is encountered. Select the appropriate management."
        tempMCQ.OptionA = "Water tight closure with 7-0 proline suture fixation, augmented with fibrin sealant"
        tempMCQ.AnswerB = true
        tempMCQ.OptionB = "Fibrin glue analogue with direct compression until leak stops"
        tempMCQ.AnswerB = false
        tempMCQ.OptionC = "Water tight closure with 5-0 vicryl suture fixation, augmented with fibrin sealant"
        tempMCQ.AnswerB = false
        tempMCQ.OptionD = "Fat patch augmented closure using 7-0 proline suture fixation"
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "Which nerve root is most likely to be injured during this procedure?"
        tempMCQ.OptionA = "L3 "
        tempMCQ.AnswerB = false
        tempMCQ.OptionB = "L4 "
        tempMCQ.AnswerB = false
        tempMCQ.OptionC = "L5 "
        tempMCQ.AnswerB = true
        tempMCQ.OptionD = "S1"
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "Fluoroscopy is used to identify your level intraoperatively. A penfield 4 is placed in the L4-5 interlaminar space. This will point to which pedicle?"
        tempMCQ.OptionA = "L3"
        tempMCQ.AnswerB = false
        tempMCQ.OptionB = "L4"
        tempMCQ.AnswerB = true
        tempMCQ.OptionC = "L5 "
        tempMCQ.AnswerB = false
        tempMCQ.OptionD = "S1"
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "A subtotal discectomy is performed and the patient is transported to the PACU safely. Postoperatively they complain of numbness on the right thigh. The most likely cause is"
        tempMCQ.OptionA = "Meralgia pasasthetica"
        tempMCQ.AnswerB = true
        tempMCQ.OptionB = "L2 nerve root tethering"
        tempMCQ.AnswerB = false
        tempMCQ.OptionC = "Stretch of the femoral nerve during positioning"
        tempMCQ.AnswerB = false
        tempMCQ.OptionD = "Compression of the lumbosacral plexus"
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "The superior facet attaches to the"
        tempMCQ.OptionA = "Lamina"
        tempMCQ.AnswerB = false
        tempMCQ.OptionB = "Pedicle"
        tempMCQ.AnswerB = true
        tempMCQ.OptionC = "Pars"
        tempMCQ.AnswerB = false
        tempMCQ.OptionD = "Spinous Process"
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "Select a diagnosis."
        tempMCQ.OptionA = "Type 1 odontoid"
        tempMCQ.AnswerB = false
        tempMCQ.OptionB = "Type 2 odontoid"
        tempMCQ.AnswerB = true
        tempMCQ.OptionC = "Type 3 odontoid"
        tempMCQ.AnswerB = false
        tempMCQ.OptionD = "Os odontoidium"
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "Fractures involving the superior articular facet of C2 are classified as "
        tempMCQ.OptionA = "Type 1 odontoid"
        tempMCQ.AnswerB = false
        tempMCQ.OptionB = "Type 2 odontoid"
        tempMCQ.AnswerB = false
        tempMCQ.OptionC = "Type 3 odontoid"
        tempMCQ.AnswerB = true
        tempMCQ.OptionD = ""
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "The transverse ligament in this case is likely"
        tempMCQ.OptionA = "Disrupted"
        tempMCQ.AnswerB = false
        tempMCQ.OptionB = "Intact"
        tempMCQ.AnswerB = true
        tempMCQ.OptionC = ""
        tempMCQ.AnswerB = false
        tempMCQ.OptionD = ""
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "Select the best treatment for this patient"
        tempMCQ.OptionA = "Anterior odontoid screw"
        tempMCQ.AnswerB = true
        tempMCQ.OptionB = "Posterior C1-2 fixation using C1 lateral mass C2 pars screws"
        tempMCQ.AnswerB = false
        tempMCQ.OptionC = "Occiput to C3 fusion"
        tempMCQ.AnswerB = false
        tempMCQ.OptionD = "Conservative management"
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "Select a diagnosis."
        tempMCQ.OptionA = "Type 1 odontoid"
        tempMCQ.AnswerB = false
        tempMCQ.OptionB = "Type 2 odontoid"
        tempMCQ.AnswerB = true
        tempMCQ.OptionC = "Type 3 odontoid"
        tempMCQ.AnswerB = false
        tempMCQ.OptionD = "Os odontoidium"
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "Fractures involving the superior articular facet of C2 are classified as "
        tempMCQ.OptionA = "Type 1 odontoid"
        tempMCQ.AnswerB = false
        tempMCQ.OptionB = "Type 2 odontoid"
        tempMCQ.AnswerB = false
        tempMCQ.OptionC = "Type 3 odontoid"
        tempMCQ.AnswerB = true
        tempMCQ.OptionD = ""
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "The transverse ligament in this case is likely"
        tempMCQ.OptionA = "Disrupted"
        tempMCQ.AnswerB = false
        tempMCQ.OptionB = "Intact"
        tempMCQ.AnswerB = true
        tempMCQ.OptionC = ""
        tempMCQ.AnswerB = false
        tempMCQ.OptionD = ""
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        
        tempMCQ.OptionA = "Select the best treatment for this patient"
        tempMCQ.OptionA = "Anterior odontoid screw"
        tempMCQ.AnswerB = true
        tempMCQ.OptionB = "Posterior C1-2 fixation using C1 lateral mass C2 pars screws"
        tempMCQ.AnswerB = false
        tempMCQ.OptionC = "Occiput to C3 fusion"
        tempMCQ.AnswerB = false
        tempMCQ.OptionD = "Conservative management"
        tempMCQ.AnswerB = false
        mcqArray.append(tempMCQ)
        tempPrompt.Mcqs = mcqArray
        promptArray.append(tempPrompt)
        
        caseArray.append(tempCase)
       
        return caseArray
    }
}
