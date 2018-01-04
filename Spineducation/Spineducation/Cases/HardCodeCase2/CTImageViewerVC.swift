//
//  CaseImageViewer.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2018-01-01.
//  Copyright © 2018 Katrine Rachitsky. All rights reserved.
//

import UIKit

class CTImageViewerVC: UIViewController {

    var AxialImageArray = [UIImage]()
    var CoronalImageArray = [UIImage]()
    var SagitalImageArray = [UIImage]()
    
    @IBOutlet weak var MainScrollView: UIScrollView!
    
    @IBAction func ClickedAxial(_ sender: Any) {
        displayeImages(array: AxialImageArray)

    }
    @IBAction func ClickedCoronal(_ sender: Any) {
        displayeImages(array: CoronalImageArray)

    }
    @IBAction func ClickedSagittal(_ sender: Any) {
        displayeImages(array: SagitalImageArray)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        MainScrollView.frame = view.frame
        
        AxialImageArray = [#imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.34.08"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.34.25"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.34.38"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.34.52"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.35.06"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.35.26"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.35.36"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.35.50"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.36.01"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.36.13"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.36.32")]
        CoronalImageArray = [ #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.31.01"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.31.17"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.31.36"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.31.49"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.32.01"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.32.15"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.32.24"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.32.24"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.32.37"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.32.50"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.33.02")]
        SagitalImageArray = [ #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.20.57"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.21.18"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.21.35"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.22.06"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.22.19"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.22.32"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.22.32"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.22.44"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.22.57"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.23.14"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.23.27"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.23.38"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.23.53"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.27.01"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.27.19"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.27.30"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.27.48"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.28.01"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.28.14"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.28.26"), #imageLiteral(resourceName: "Screen Shot 2017-10-01 at 22.28.39")]
        
        displayeImages(array: AxialImageArray)

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
            
            let xPosition = self.MainScrollView.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.MainScrollView.frame.width, height: self.MainScrollView.frame.height )
            
            MainScrollView.contentSize.width = MainScrollView.frame.width *  CGFloat(i + 1)
            
            MainScrollView.addSubview(imageView)
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
