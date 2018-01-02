//
//  PromptCell.swift
//  Spineducation
//
//  Created by Randa Mohsen on 2018-01-01.
//  Copyright © 2018 Katrine Rachitsky. All rights reserved.
//

import UIKit

class PromptCell: UITableViewCell {

    @IBOutlet weak var FirstView: UIView!
    @IBOutlet weak var SecondView: UIView!
    @IBOutlet weak var FirstViewLabel: UILabel!
    @IBOutlet weak var SecondViewLabel: UILabel!
    
    @IBOutlet weak var SecondViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var showDetails = false {
        didSet {
            SecondViewHeight.priority = UILayoutPriority(rawValue: UILayoutPriority.RawValue(showDetails ? 250:999))
        }
    }

}
