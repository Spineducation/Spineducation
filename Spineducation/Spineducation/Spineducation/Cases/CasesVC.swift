//
//  CasesVC.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2017-11-05.
//  Copyright © 2017 Katrine Rachitsky. All rights reserved.
//

import UIKit

class CasesVC: UIViewController, HomeModelDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var CaseTableView: UITableView!
    var homeModel = HomeModel()
    var medicalCasee = [MedicalCase]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set self as the tableview's datasource and delegate
        CaseTableView.delegate = self
        CaseTableView.dataSource = self
        
        // initiate calling the items download
        homeModel.getItems()
        homeModel.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemsDownloaded(medicalCase: [MedicalCase]) {
        self.medicalCasee = medicalCase
        DispatchQueue.main.async {
            self.CaseTableView.reloadData()
        }    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedIndexPath = CaseTableView.indexPathForSelectedRow
        
        if let indexPath = selectedIndexPath {
            
            // set the casedataToDisplay property of the controller
            let CaseDataVC = segue.destination as! CaseDataVC
            CaseDataVC.caseDataToDisplay = medicalCasee[indexPath.row]
        }
        
    }
    
    // MARK: - UITableView Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return medicalCasee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        
        cell.textLabel?.text = medicalCasee[indexPath.row].caseName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToCase", sender: self)
    }
    
    
}

