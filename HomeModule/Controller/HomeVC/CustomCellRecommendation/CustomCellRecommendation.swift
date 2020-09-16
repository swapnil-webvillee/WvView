//
//  CustomCellRecommendation.swift
//  Browcery
//
//  Created by apple on 09/09/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class CustomCellRecommendation: UICollectionViewCell
{
    //MARK:Outltes
    @IBOutlet weak var lblOffer: LabelClassSwift!
    @IBOutlet weak var imgViewHeart: UIImageView!
    @IBOutlet weak var viewHeart: UIView!
    @IBOutlet weak var imgViewProduct: UIImageView!
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPriceQty: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var viewProductCount: UIViewClass!
    @IBOutlet weak var viewAdd: UIViewClass!
    @IBOutlet weak var btnAdd: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
