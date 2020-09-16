//
//  CustomTCellOrder.swift
//  Browcery
//
//  Created by wvmac2 on 09/09/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class CustomTCellOrder: UITableViewCell {

    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var lblOrderNo: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var btnTrackOrder: ButtonClass!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
