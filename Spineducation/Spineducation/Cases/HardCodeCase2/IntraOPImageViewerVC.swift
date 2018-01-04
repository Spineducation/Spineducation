//
//  IntraOPImageViewerVC.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2018-01-04.
//  Copyright © 2018 Katrine Rachitsky. All rights reserved.
//

import UIKit

class IntraOPImageViewerVC: UIViewController {

    var ImageArray = [UIImage]()

    @IBOutlet weak var IntraOPScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        IntraOPScrollView.frame = view.frame
        
        ImageArray = [#imageLiteral(resourceName: "Intra op 01"), #imageLiteral(resourceName: "Intra op 02")]
        displayeImages(array: ImageArray)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayeImages(array: [UIImage]){
        for i in 0..<array.count {
            let imageView = UIImageView()
            imageView.image = array[i]
            imageView.contentMode = .scaleAspectFit
            
            let xPosition = self.IntraOPScrollView.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.IntraOPScrollView.frame.width, height: self.IntraOPScrollView.frame.height )
            
            IntraOPScrollView.contentSize.width = IntraOPScrollView.frame.width *  CGFloat(i + 1)
            
            IntraOPScrollView.addSubview(imageView)
        }
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
