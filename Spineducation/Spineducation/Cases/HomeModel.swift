//
//  HomeModel.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-10-15.
//  Copyright © 2017 Spineducation. All rights reserved.
//

import UIKit

protocol HomeModelDelegate {
    
    func itemsDownloaded(medicalCase:[MedicalCase])
    
}

class HomeModel: NSObject {
    
    var delegate:HomeModelDelegate?
    
    func getItems() {
        // hit the webservice url
        let serviceUrl = "http://35.182.157.200/info.php"
        
        //download the JSON data
        let url = URL(string: serviceUrl)
        
        if let url = url {
            // creste URL session
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler:
            { (data, response, error) in
                
                if error == nil {
                    // succeeded
                    // call the function to parse the data separately
                    self.parseJson(data!)
                } else {
                    //error occured
                }
            })
            
            //start the task
            task.resume()
        }
        // notify the view controller and pass the data back
        
    }
    
    func parseJson(_ data:Data) {
        var caseArray = [MedicalCase]()
        //parse data out into the location structs
        do {
            // parse array into json object
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            
            // loop through each result in the json array
            for jsonResult in jsonArray {
                
                // cast json result as a dictionary
                let jsonCase = jsonResult as! [String:String]
                
                // create new Location and set it's properties
                let medicalCase = MedicalCase(caseName: jsonCase["CASE_NAME"]!, history: jsonCase["HISTORY"]!, phsyical: jsonCase["PHYSICAL"]!)
                
                // add it to the array
                caseArray.append(medicalCase)
            }
            
            // Pass the array back
            
            delegate?.itemsDownloaded(medicalCase: caseArray)
            
        }
        catch {
            print("there was an error")
        }
    }
    
}

