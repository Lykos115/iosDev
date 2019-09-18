//
//  ImgCell.swift
//  Tumblr
//
//  Created by Lykøs on 9/17/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import UIKit

class ImgCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
