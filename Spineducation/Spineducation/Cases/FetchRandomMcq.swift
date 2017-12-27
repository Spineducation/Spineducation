//
//  FetchRandomMcq.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-12-17.
//  Copyright © 2017 Katrine Rachitsky. All rights reserved.
//


import UIKit

// if the view controller is going to conform to this protocol, then it must implement this function
protocol FetchRandomMcqDelegate {
    
    // pass back an array of MedicalCases
    func itemsDownloaded(mcqs:[mcq])
    
}

class FetchRandomMcq: NSObject{
    
    // a way to contact the view controller when it's finished downloading
    var delegate:FetchRandomMcqDelegate?
    
    // this is the function the view controller with call
    func getItems() {
//        print("entered function getItems")
        // identify the webservice url
        let serviceUrl = "http://35.182.157.200/tryme.php"
        
        //download the JSON data
        let url = URL(string: serviceUrl)
        
        if let url = url {
            // url object is not nil

            // creste URL session
            let session = URLSession(configuration: .default)
            
            // create data task
            let task = session.dataTask(with: url, completionHandler:
            { (data, response, error) in
                
                print("checkpoint")
                
                if error == nil {
                    print("no error, callng function parseJson")

                    // succeeded
                    // call the function to parse the data separately
                    self.parseJson(data!)
                } else {
                    print("RANDA ERROR: COULDN'T CREATE DATA TASK")
                }
            })
            
            //start the task
            task.resume()
        } else {
            print("RANDA ERROR: PROBLEM WITH URL")
            
        }
        // notify the view controller and pass the data back
        
    }
    
    // function called by getItems()
    func parseJson(_ data:Data) {
//        print("entered function parseJson")
        
        // empty array that will store objects of type MedicalCase
        var McqArray = [mcq]()
        
        //parse data out into the MedicalCase structs
        
        do {
            
            // parse array into json object
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            
            // loop through each result in the json array
            for jsonResult in jsonArray {
//                print("found another json value")
                // cast json result as a dictionary where all of the keys are strings, and all of their values are strings
                let jsonMCQ = jsonResult as! [String:String]
                
                var ansA = false
                var ansB = false
                var ansC = false
                var ansD = false

                if jsonMCQ["OPTION_A_TRUE"]?.lowercased() == "true"
                {
                    ansA = true
                }
                if jsonMCQ["OPTION_B_TRUE"]?.lowercased() == "true"
                {
                    ansB = true
                }
                if jsonMCQ["OPTION_C_TRUE"]?.lowercased() == "true"
                {
                    ansC = true
                }
                if jsonMCQ["OPTION_D_TRUE"]?.lowercased() == "true"
                {
                    ansD = true
                }
                
                // create new multiple choice question and set it's properties
                let mcquestion = mcq(Question: jsonMCQ["QUESTION"]!, OptionA: jsonMCQ["OPTION_A"]!, AnswerA: ansA, OptionB: jsonMCQ["OPTION_B"]!, AnswerB: ansB, OptionC: jsonMCQ["OPTION_C"]!, AnswerC: ansC, OptionD: jsonMCQ["OPTION_D"]!, AnswerD: ansD, FutherDetail: "", SurgicalCategories: jsonMCQ["SURGICAL_CATG"]!, SurgicalCategories_list: [0], AnatomicalRegions: jsonMCQ["ANATC_REGION_ID"]!, AnatomicalRegions_list: [0])
                
                // add it to the array
                McqArray.append(mcquestion)
            }
            
            // Pass the array back to delegate (the view controller)
            delegate?.itemsDownloaded(mcqs: McqArray)
            
        }
        catch {
            print("there was an error")
        }
    }
    
}
