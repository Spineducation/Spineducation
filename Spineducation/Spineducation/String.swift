//
//  String.swift
//  Spineducation
//
//  Created by Katrine Rachitsky on 2017-12-11.
//  Copyright © 2017 Katrine Rachitsky. All rights reserved.
//
 // this class is only necessary if being used to convert a character to a 2d image
import UIKit
extension String {
    
    func image() -> UIImage? {
        let size = CGSize(width: 35, height: 35)
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        UIColor.clear.set()
        let rect = CGRect(origin: CGPoint(), size: size)
        UIRectFill(CGRect(origin: CGPoint(), size: size))
        (self as NSString).draw(in: rect, withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 30)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
