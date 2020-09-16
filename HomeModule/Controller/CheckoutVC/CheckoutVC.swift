//
//  CheckoutVC.swift
//  Browcery
//
//  Created by wvmac2 on 14/09/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class CheckoutVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var btnChangeLocation: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnViewAll: UIButton!
    @IBOutlet weak var txtFldPromocode: TextFieldClass!
    @IBOutlet weak var btnApply: ButtonClass!
    @IBOutlet weak var lblItemCost: UILabel!
    @IBOutlet weak var lblDeliveryCharge: UILabel!
    @IBOutlet weak var lblDiscountPrice: UILabel!
    @IBOutlet weak var btnProceed: ButtonClass!
    @IBOutlet weak var lblTotal: UILabel!
    
    
    @IBOutlet weak var constraintHeightTblView: NSLayoutConstraint! //data count * 45
    var arrData = Array<Any>()
    var cur_page = 0
    var last_page = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- ButtonAction
    @IBAction func actionBack(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionChangeLocation(_ sender: Any) {
    }
    
    @IBAction func actionViewAll(_ sender: Any) {
    }
    
    @IBAction func actionApply(_ sender: ButtonClass) {
        
        sender.animateTouchUpInside {
            
        }
    }
    
    @IBAction func actionProceed(_ sender: ButtonClass) {
        
        sender.animateTouchUpInside {
            
        }
    }
    
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CustomTCellCategory") as? CustomTCellCategory
        if cell == nil
        {
            let arr = Bundle.main.loadNibNamed("CustomTCellCategory", owner: self, options: nil)
            cell = arr?.first as? CustomTCellCategory
        }
        
        //let dictCell = arrData[indexPath.row] as! NSDictionary
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "ProductDescriptionVC") as! ProductDescriptionVC
        self.navigationController?.pushViewController(obj, animated: true)
    }
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        if indexPath.row == self.arrData.count - 1 && indexPath.row != 0 && self.cur_page != self.last_page && arrData.count > 0 && arrData.count%50 == 0
        {
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
