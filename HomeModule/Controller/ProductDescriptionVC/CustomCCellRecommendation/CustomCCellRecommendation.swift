//
//  CustomCCellRecommendation.swift
//  Browcery
//
//  Created by wvmac2 on 31/08/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class CustomCCellRecommendation: UICollectionViewCell {
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
    @IBOutlet weak var lblQuantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
