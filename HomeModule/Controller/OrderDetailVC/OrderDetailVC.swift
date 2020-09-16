//
//  OrderDetailVC.swift
//  Browcery
//
//  Created by wvmac2 on 14/09/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class OrderDetailVC: UIViewController, CustomSegmentedControlDelegate,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var lblOrderID: UILabel!
    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var lblOrderDate: UILabel!
    @IBOutlet weak var lblDeliveryDate: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblOrderStatus: UILabel!
    @IBOutlet weak var lblPaymentMode: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblDeliveryPrice: UILabel!
    @IBOutlet weak var lblDiscountPrice: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var scrlView: UIScrollView!
    @IBOutlet weak var tblView: UITableView!
    

    @IBOutlet weak var segmentControl: CustomSegmentedControl!         {
             didSet
            {
                 segmentControl.setButtonTitles(buttonTitles: ["Summary","Item Detail"])
                 segmentControl.selectorViewColor = AppDelegate.shared().APP_COLOR
                 segmentControl.selectorTextColor = #colorLiteral(red: 0.09803921569, green: 0.08235294118, blue: 0.1058823529, alpha: 1)// AppDelegate.shared().LABEL_COLOR
                 segmentControl.textColor = #colorLiteral(red: 0.4235294118, green: 0.4039215686, blue: 0.4352941176, alpha: 1)
                 segmentControl.delegate = self
                 segmentControl.selectedViewWidth = 25
                 segmentControl.selectedViewHeight = 4
                segmentControl.appFont = UIFont(name: "NunitoSans-SemiBold", size: 16)!
             }
         }
    
    var arrData = Array<Any>()
    var cur_page = 0
    var last_page = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.isHidden = true
        self.scrlView.isHidden = !self.tblView.isHidden
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Segment delegate
    
    func change(to index: Int, sender: CustomSegmentedControl) {
        if index == 0 {
            tblView.isHidden = true
        }else{
            tblView.isHidden = false
        }
        self.scrlView.isHidden = !self.tblView.isHidden
    }

    //MARK:- Action Button

    @IBAction func actionBack(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionDownloadInvoice(_ sender: Any) {
    }
    @IBAction func actionReorder(_ sender: ButtonClass) {
        
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
        cell?.btnAdd.isHidden = true
        cell?.viewQuantity.isHidden = true
        //let dictCell = arrData[indexPath.row] as! NSDictionary
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let vc = AppStoryboard.Home.instance.instantiateViewController(withIdentifier: WishlistVC.storyboardID)
        self.navigationController!.pushViewController(vc, animated: true)
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
