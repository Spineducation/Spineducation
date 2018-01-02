//
//  CaseDetailVC.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2018-01-01.
//  Copyright © 2018 Katrine Rachitsky. All rights reserved.
//

import UIKit

class CaseDetailVC: UIViewController {

    var SelectedIndex = -1
    var DataArray:[[String:String]] = [["First Name":"Randa", "Last Name": "Mohsen"] , ["First Name":"Katrine", "Last Name": "Rachitsky"]]
    
    @IBOutlet weak var caseDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return DataArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (SelectedIndex == indexPath.row) {
            return 100;
        }
        else {
            return 40;
        }
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! PromptCell
        
        let obj = DataArray[indexPath.row]
        cell.FirstViewLabel.text = obj["First Name"]
        cell.SecondViewLabel.text = obj["Last Name"]
        
        return cell
    }
    
    // Override to support editing the table view.
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (SelectedIndex == indexPath.row) {
            SelectedIndex = -1
        }
        else {
            SelectedIndex = indexPath.row
        }
        
        self.caseDetailTableView.reloadRows( at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        self.caseDetailTableView.endUpdates()
    }

}
