//
//  CustomCellAddress.swift
//  Browcery
//
//  Created by wvmac2 on 09/09/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class CustomCellAddress: UITableViewCell {

    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
