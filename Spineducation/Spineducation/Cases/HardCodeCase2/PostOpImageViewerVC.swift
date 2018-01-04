//
//  PostOpImageViewerVC.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2018-01-04.
//  Copyright © 2018 Katrine Rachitsky. All rights reserved.
//

import UIKit

class PostOpImageViewerVC: UIViewController {

    var Week1 = [UIImage]()
    var Week4 = [UIImage]()
    var Week8 = [UIImage]()
    var Week16 = [UIImage]()

    @IBOutlet weak var PostOpScrollView: UIScrollView!
    
    @IBAction func ClickedWeek1(_ sender: Any) {
        displayeImages(array: Week1)

    }
    
    @IBAction func ClickedWeek4(_ sender: Any) {
        displayeImages(array: Week4)

    }
    @IBAction func ClickedWeek8(_ sender: Any) {
        displayeImages(array: Week8)

    }
    @IBAction func ClickedWeek16(_ sender: Any) {
        displayeImages(array: Week16)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        PostOpScrollView.frame = view.frame
        
        Week1 = [#imageLiteral(resourceName: "Post op 1 wk 01")]
        Week4 = [#imageLiteral(resourceName: "Post Op 4 wks 091020")]
        Week8 = [#imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.14.04")]
        Week16 = [#imageLiteral(resourceName: "Post Op 16 wks 100208 (1)"), #imageLiteral(resourceName: "Post Op 16 wks 100208 (2)"), #imageLiteral(resourceName: "Post Op 16 wks 100208 (3)"), #imageLiteral(resourceName: "Post Op 16 wks 100208 (4)"), #imageLiteral(resourceName: "Post Op 16 wks 100208 (5)")]

        displayeImages(array: Week1)
        
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
            
            let xPosition = self.PostOpScrollView.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.PostOpScrollView.frame.width, height: self.PostOpScrollView.frame.height )
            
            PostOpScrollView.contentSize.width = PostOpScrollView.frame.width *  CGFloat(i + 1)
            
            PostOpScrollView.addSubview(imageView)
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
