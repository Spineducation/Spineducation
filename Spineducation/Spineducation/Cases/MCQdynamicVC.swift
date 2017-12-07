//fuck lol//
//  MCQdynamicVC.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-12-04.
//  Copyright © 2017 Katrine Rachitsky. All rights reserved.
//

import UIKit

class MCQdynamicVC: UIViewController {

    @IBOutlet weak var questionField: UITextView!
   
    @IBOutlet weak var OptionAField: UIButton!
    @IBOutlet weak var OptionBField: UIButton!
    @IBOutlet weak var OptionCField: UIButton!
    @IBOutlet weak var OptionDField: UIButton!
    
    @IBOutlet weak var NextButton: UIButton!
    
    var question1:[String] = ["Deficits in pain and temperature sensation in cape like distribution over back and neck – light touch and vibration preserved.  Asymetric abdominal reflexes, hyperactive lower limb reflexes. What is the diagnosis?", "Syringobulbia", "Syringomyelia", "Diastematomyelia", "Dysraphism",  "B"]
    var question2:[String] = ["Congenital spinal stenosis occurs when the Torg-Pavlov ratio is less than ", "0.6", "0.8", "1", "1.2",  "B"]
    var question3:[String] = ["Following herniation of a lumbar disc", "the greatest amount of resorption occurs with sequestered discs.", "the greatest amount of resorption occurs after minor protrusions.", "the greatest amount of resorption occurs after disc extrusion.", "Resorption is similar across all types of disc herniations.",  "A"]
    var question4:[String] = ["Radiculopathy from residual adolescent idiopathic scoliosis typically occurs ", "from the concavity of the fractional curve below the main structural curve", "from the concavity of the main structural curve", "from the concavity of the lowest nonstructural curve", "from the convexity of the lumbar curve",  "A"]
    
    var Questions = [[String]]()
    
    var i = 1
    @IBAction func SelectNextButton(_ sender: Any) {
        OptionAField.isEnabled = true
        OptionBField.isEnabled = true
        OptionCField.isEnabled = true
        OptionDField.isEnabled = true
        OptionAField.setTitleColor(UIColor .black, for: UIControlState.normal)
        OptionBField.setTitleColor(UIColor .black, for: UIControlState.normal)
        OptionCField.setTitleColor(UIColor .black, for: UIControlState.normal)
        OptionDField.setTitleColor(UIColor .black, for: UIControlState.normal)

        if i<Questions.count{
            questionField.text = Questions[i][0]
            OptionAField.setTitle(Questions[i][1], for: .normal)
            OptionBField.setTitle(Questions[i][2], for: .normal)
            OptionCField.setTitle(Questions[i][3], for: .normal)
            OptionDField.setTitle(Questions[i][4], for: .normal)

            i += 1
        }
        
    }
    @IBAction func SelectOptionA(_ sender: Any) {
        if Questions[i-1][5] != "A"{
            OptionAField.setTitleColor(UIColor .red, for: UIControlState.normal)
        }
        ShowCorrectAnswer()
    }
    @IBAction func SelectOptionB(_ sender: Any) {
        if Questions[i-1][5] != "B"{
            OptionBField.setTitleColor(UIColor .red, for: UIControlState.normal)
        }
        ShowCorrectAnswer()
    }
    @IBAction func SelectOptionC(_ sender: Any) {
        if Questions[i-1][5] != "C"{
            OptionCField.setTitleColor(UIColor .red, for: UIControlState.normal)
        }
        ShowCorrectAnswer()
    }
    @IBAction func SelectOptionD(_ sender: Any) {
        if Questions[i-1][5] != "D"{
            OptionDField.setTitleColor(UIColor .red, for: UIControlState.normal)
        }
        ShowCorrectAnswer()
    }
    
    func ShowCorrectAnswer(){
        OptionAField.isEnabled = false
        OptionBField.isEnabled = false
        OptionCField.isEnabled = false
        OptionDField.isEnabled = false
        if Questions[i][5] == "A"{
            OptionAField.setTitleColor(UIColor .green, for: UIControlState.normal)
        }
        if Questions[i][5] == "B"{
            OptionBField.setTitleColor(UIColor .green, for: UIControlState.normal)
        }
        if Questions[i][5] == "C"{
            OptionCField.setTitleColor(UIColor .green, for: UIControlState.normal)
        }
        if Questions[i][5] == "D"{
            OptionDField.setTitleColor(UIColor .green, for: UIControlState.normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Questions.append(question1)
        Questions.append(question2)
        Questions.append(question3)
        Questions.append(question4)
        
        questionField.text = question1[0]
        OptionAField.setTitle(question1[1], for: .normal)
        OptionBField.setTitle(question1[2], for: .normal)
        OptionCField.setTitle(question1[3], for: .normal)
        OptionDField.setTitle(question1[4], for: .normal)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
