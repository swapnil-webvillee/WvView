//
//  CustomTCellCategory.swift
//  Browcery
//
//  Created by wvmac2 on 31/08/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class CustomTCellCategory: UITableViewCell {

    @IBOutlet weak var viewImageBG: UIViewClass!
    @IBOutlet weak var viewFav: UIView!
    @IBOutlet weak var imgViewFav: UIImageView!
    @IBOutlet weak var btnFav: UIButton!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblWeightAndPrice: UILabel!
    @IBOutlet weak var lblDiscountedPrice: UILabel!
    @IBOutlet weak var viewQuantity: UIViewClass!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var imgViewProduct: UIImageView!
    @IBOutlet weak var btnAdd: ButtonClass!
    @IBOutlet weak var btnCart: UIButton!
    @IBOutlet weak var viewCart: UIView!
    @IBOutlet weak var constraintWidthCart: NSLayoutConstraint! // 0 or 40
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
