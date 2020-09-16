//
//  CollectionReusableView.swift
//  BookieBot
//
//  Created by wvmac2 on 06/07/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class CollectionReusableView: UICollectionReusableView
{
    //MARK:----- Outlets -----
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var imgViewEditIcon: UIImageView!
    @IBOutlet weak var txtFieldSearch: TextFieldClass!
    @IBOutlet weak var imgViewSearch: UIImageView!
//    @IBOutlet weak var pagerView: FSPagerView!
//    @IBOutlet weak var pagerView2: FSPagerView!
    @IBOutlet weak var lblAddress: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
}
