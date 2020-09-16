//
//  CustomCellSection.swift
//  Browcery
//
//  Created by apple on 02/09/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class CustomCellSection: UITableViewCell
{
    //MARK:Outlets
    @IBOutlet weak var btnViewAll: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var collView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
