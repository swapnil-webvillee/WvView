//
//  CustomCellFSPagerView.swift
//  MyTV
//
//  Created by WV-Mac4 on 06/03/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit
import FSPagerView

class CustomCellFSPagerView: FSPagerViewCell
{
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgViewPlayer: ImageViewClass!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

}
