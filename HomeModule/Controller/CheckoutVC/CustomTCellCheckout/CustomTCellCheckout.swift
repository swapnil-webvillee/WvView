//
//  CustomTCellCheckout.swift
//  Browcery
//
//  Created by wvmac2 on 14/09/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class CustomTCellCheckout: UITableViewCell {

    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var viewQuantity: UIViewClass!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var btnPlus: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
