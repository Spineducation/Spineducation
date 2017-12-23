//fuck lol//
//  MCQdynamicVC.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-12-04.
//  Copyright © 2017 Katrine Rachitsky. All rights reserved.
//

import UIKit

class MCQdynamicVC: UIViewController, FetchRandomMcqDelegate{
   
    var multiplechoicequestions = [mcq]()

    var randomMcq = FetchRandomMcq()

    @IBOutlet weak var questionField: UITextView!
   
    @IBOutlet weak var OptionAField: UIButton!
    @IBOutlet weak var OptionBField: UIButton!
    @IBOutlet weak var OptionCField: UIButton!
    @IBOutlet weak var OptionDField: UIButton!
    
    @IBOutlet weak var NextButton: UIButton!

    var i:Int = 0
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DisplayMCQ(){
        print("Entered DisplayMCQ")
        
        print("my count issiisisis: ")
        print(multiplechoicequestions.count)

        OptionAField.isEnabled = true
        OptionBField.isEnabled = true
        OptionCField.isEnabled = true
        OptionDField.isEnabled = true
        
        OptionAField.setTitleColor(UIColor .black, for: UIControlState.normal)
        OptionBField.setTitleColor(UIColor .black, for: UIControlState.normal)
        OptionCField.setTitleColor(UIColor .black, for: UIControlState.normal)
        OptionDField.setTitleColor(UIColor .black, for: UIControlState.normal)

        i = Int(arc4random_uniform(UInt32(multiplechoicequestions.count)))

        questionField.text = multiplechoicequestions[i].Question
        OptionAField.setTitle(multiplechoicequestions[i].OptionA, for: .normal)
        OptionBField.setTitle(multiplechoicequestions[i].OptionB, for: .normal)
        OptionCField.setTitle(multiplechoicequestions[i].OptionC, for: .normal)
        OptionDField.setTitle(multiplechoicequestions[i].OptionD, for: .normal)
        
    }
    
    func itemsDownloaded(mcqs mcquestions: [mcq]) {
        print("Entered itemsDownloaded")
        print(mcquestions.count)

        self.multiplechoicequestions = mcquestions

        DispatchQueue.main.async {
            self.DisplayMCQ()
        }
    }
    
    @IBAction func SelectNextButton(_ sender: Any) {
        print("Entered SelectNextButton")

        DisplayMCQ()
        
    }
    
    @IBAction func SelectOptionA(_ sender: Any) {
        print("Entered SelectOptionA")

        if multiplechoicequestions[i].AnswerA != true{
            OptionAField.setTitleColor(UIColor .red, for: UIControlState.normal)
        }
        ShowCorrectAnswer()
    }
    @IBAction func SelectOptionB(_ sender: Any) {
        print("Entered SelectOptionB")

        if multiplechoicequestions[i].AnswerB != true{
            OptionBField.setTitleColor(UIColor .red, for: UIControlState.normal)
        }
        ShowCorrectAnswer()
    }
    @IBAction func SelectOptionC(_ sender: Any) {
        print("Entered SelectOptionC")

        if multiplechoicequestions[i].AnswerC != true{
            OptionCField.setTitleColor(UIColor .red, for: UIControlState.normal)
        }
        ShowCorrectAnswer()
    }
    @IBAction func SelectOptionD(_ sender: Any) {
        print("Entered SelectOptionD")

        if multiplechoicequestions[i].AnswerD != true{
            OptionDField.setTitleColor(UIColor .red, for: UIControlState.normal)
        }
        ShowCorrectAnswer()
    }
    
    func ShowCorrectAnswer(){
        print("Entered ShowCorrectAnswer")

        OptionAField.isEnabled = false
        OptionBField.isEnabled = false
        OptionCField.isEnabled = false
        OptionDField.isEnabled = false
        if multiplechoicequestions[i].AnswerA == true{
            OptionAField.setTitleColor(UIColor .green, for: UIControlState.normal)
        }
        if multiplechoicequestions[i].AnswerB == true{
            OptionBField.setTitleColor(UIColor .green, for: UIControlState.normal)
        }
        if multiplechoicequestions[i].AnswerC == true{
            OptionCField.setTitleColor(UIColor .green, for: UIControlState.normal)
        }
        if multiplechoicequestions[i].AnswerD == true{
            OptionDField.setTitleColor(UIColor .green, for: UIControlState.normal)
        }
        
    }

    override func viewDidLoad() {
        print("Entered viewDidLoad")

        super.viewDidLoad()
        
        // initiate calling the items download
        randomMcq.getItems()
        
        // this view controller is conforming to the protocol so it must set itself as the delegate property of the home model
        randomMcq.delegate = self
        
        //DisplayMCQ()

    }

}
