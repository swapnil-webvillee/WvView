//
//  MyAccountVC.swift
//  Browcery
//
//  Created by wvmac2 on 15/09/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class MyAccountVC: UIViewController ,UITableViewDataSource,UITableViewDelegate {

    var arrData = [["name":"Order","image":#imageLiteral(resourceName: "icon_order"),"image_unselect":#imageLiteral(resourceName: "icon_order_un")],["name":"Profile","image":#imageLiteral(resourceName: "icon_profile"),"image_unselect":#imageLiteral(resourceName: "icon_profile_un")],["name":"Address","image":#imageLiteral(resourceName: "icon_address"),"image_unselect":#colorLiteral(red: 0.5397877097, green: 0.7709214091, blue: 0.3303759098, alpha: 1)],["name":"Wishlist","image":#imageLiteral(resourceName: "icon_wishlist"),"image_unselect":#imageLiteral(resourceName: "icon_wishlist_un")],["name":"Notification","image":#imageLiteral(resourceName: "icon_notification"),"image_unselect":#imageLiteral(resourceName: "icon_notification_un")],["name":"About Us","image":#imageLiteral(resourceName: "icon_terms"),"image_unselect":#imageLiteral(resourceName: "icon_terms_un")],["name":"Terms & Conditions","image":#imageLiteral(resourceName: "icon_terms"),"image_unselect":#imageLiteral(resourceName: "icon_terms_un")]]
    var cur_page = 0
    var last_page = 0
    var selected_index = -1
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgViewUser: UIImageView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.contentInset = UIEdgeInsets.init(top: 15, left: 0, bottom: 0, right: 0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionBack(_ sender: Any) {
    }
    @IBAction func actionEdit(_ sender: Any) {
    }
    
    @IBAction func actionChangePassword(_ sender: Any) {
    }
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CustomTCellAccount") as? CustomTCellAccount
        if cell == nil
        {
            let arr = Bundle.main.loadNibNamed("CustomTCellAccount", owner: self, options: nil)
            cell = arr?.first as? CustomTCellAccount
        }
        let dictCell = arrData[indexPath.row]
        cell?.lblTitle.text = "\(dictCell["name"] ?? "")"
        if selected_index == indexPath.row {
            cell?.lblTitle.textColor = #colorLiteral(red: 0.5397877097, green: 0.7709214091, blue: 0.3303759098, alpha: 1)
            cell?.imgViewIcon.image = (dictCell["image"] as! UIImage)
        }else{
            cell?.lblTitle.textColor = #colorLiteral(red: 0.2702315748, green: 0.2523652911, blue: 0.2743803561, alpha: 1)
            cell?.imgViewIcon.image = (dictCell["image_unselect"] as! UIImage)


        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        selected_index = indexPath.row
        tableView.reloadData()
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
