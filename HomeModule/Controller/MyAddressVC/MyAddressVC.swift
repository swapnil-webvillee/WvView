//
//  MyAddressVC.swift
//  Browcery
//
//  Created by wvmac2 on 09/09/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class MyAddressVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrData = Array<Any>()
    var cur_page = 0
    var last_page = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionBack(_ sender: Any) {
     }
    
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellAddress") as? CustomCellAddress
        if cell == nil
        {
            let arr = Bundle.main.loadNibNamed("CustomCellAddress", owner: self, options: nil)
            cell = arr?.first as? CustomCellAddress
        }
        cell?.lblAddress.text = "I-808, Gynx Apartment\nVijay Nagar"
        //let dictCell = arrData[indexPath.row] as! NSDictionary
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
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
