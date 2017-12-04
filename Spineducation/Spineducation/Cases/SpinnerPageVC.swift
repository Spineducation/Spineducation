//
//  SpinnerPageVC.swift
//  Spineducation
//
//  Created by Manaar Hyder on 2017-12-03.
//  Copyright © 2017 Katrine Rachitsky. All rights reserved.
//

import UIKit

class SpinnerPageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet var spinner: UIPickerView!
    
    var someInts:[String] = ["10", "20", "30"];
    
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
