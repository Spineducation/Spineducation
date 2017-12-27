//
//  HomeModel.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-10-15.
//  Copyright © 2017 Spineducation. All rights reserved.
//

import UIKit

// if the view controller is going to conform to this protocol, then it must implement this function
protocol HomeModelDelegate {
    
    // pass back an array of MedicalCases
    func itemsDownloaded(medicalCase:[MedicalCase])
    
}

class HomeModel: NSObject {
    
    // a way to contact the view controller when it's finished downloading
    var delegate:HomeModelDelegate?
    
    // this is the function the view controller with call
    func getItems() {
//        print("entered function getItems")

        // identify the webservice url
        let serviceUrl = "http://35.182.157.200/info.php"
        
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
                    // call the function, also in HomeModel.swift, to parse the data separately
                    self.parseJson(data!)
                } else {
                    print("RANDA ERROR: COULDN'T CREATE DATA TASK")
                }
            })
            
            //start the task
            task.resume()
        }
        // notify the view controller and pass the data back
        
    }
    
    // function called by getItems(), also in HomeModel.swift
    func parseJson(_ data:Data) {
//        print("entered function parseJson")

        // empty array that will store objects of type MedicalCase
        var caseArray = [MedicalCase]()
        
        //parse data out into the MedicalCase structs
        
        do {
            
            // parse array into json object
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            
            // loop through each result in the json array
            for jsonResult in jsonArray {
//                print("found another json value")

                // cast json result as a dictionary where all of the keys are strings, and all of their values are strings
                let jsonCase = jsonResult as! [String:String]
                
                // create new local medical case and set it's properties
                let medicalCase = MedicalCase(Name: jsonCase["CASE_NAME"]!, SurgicalCategory: jsonCase["SURGICAL_CATG"]!, AnatomicalRegion: jsonCase["ANATOMICAL_REGION"]!)
                
                // add it to the array
                caseArray.append(medicalCase)
            }
            
            // Pass the array back to delegate (the view controller)
            delegate?.itemsDownloaded(medicalCase: caseArray)
            
        }
        catch {
            print("there was an error")
        }
    }
    
}

