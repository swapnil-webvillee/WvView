//
//  CustomCellProducts.swift
//  Browcery
//
//  Created by apple on 09/09/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class CustomCellProducts: UICollectionViewCell
{
    //MARK:Outlets
    @IBOutlet weak var lblOffer: LabelClassSwift!
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet weak var viewHeart: UIView!
    @IBOutlet weak var imgViewHeart: UIImageView!
    @IBOutlet weak var imgViewProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblUpdatedPrice: UILabel!
    @IBOutlet weak var lblOldPrice: UILabel!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var viewProductCount: UIViewClass!
    @IBOutlet weak var viewCart: UIViewClass!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var viewAdd: UIViewClass!
    @IBOutlet weak var btnCart: UIButton!
    @IBOutlet weak var imgViewCart: UIImageView!
    

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

}
