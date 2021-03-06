//
//  CT3DImages.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2018-01-04.
//  Copyright © 2018 Katrine Rachitsky. All rights reserved.
//

import UIKit

class CT3DImageViewerVC: UIViewController {

    var ImageArray = [UIImage]()

    @IBOutlet weak var ct3dImageView: ImageStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ct3dImageView.frame = view.frame
        
        ImageArray = [#imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.38.09"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.38.32"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.38.52"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.39.12"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.39.30"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.39.45"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.39.58"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.40.10"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.40.21"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.40.36"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.40.51"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.41.03"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.41.16"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.41.27")]

        ct3dImageView.setImages(ImageArray)

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
