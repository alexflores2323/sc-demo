//
//  pictureCell.swift
//  insta
//
//  Created by Logan Caracci on 2/27/17.
//  Copyright © 2017 Logan Caracci. All rights reserved.
//

import UIKit

class pictureCell: UICollectionViewCell {
    
    
    @IBOutlet weak var picImg: UIImageView!
    
    // default func
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // alignment
        let width = UIScreen.main.bounds.width
        picImg.frame = CGRect(x: 0, y: 0, width: width / 3, height: width / 3)
    }
}
