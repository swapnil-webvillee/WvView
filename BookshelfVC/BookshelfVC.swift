//
//  BookshelfVC.swift
//  BookieBot
//
//  Created by apple on 03/07/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit
import ScrollableSegmentedControl
import LGSideMenuController

class BookshelfVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPopoverPresentationControllerDelegate,CustomSegmentedControlDelegate, LGSideMenuDelegate
{
    //MARK:------- Outlets ----------
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var viewSchedule: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtFieldDate: TextFieldClass!
    @IBOutlet weak var txtFieldTime: TextFieldClass!
    @IBOutlet weak var btnSchhedule: ButtonClass!
    @IBOutlet weak var segmentControl: CustomSegmentedControl!
    {
        didSet
        {
            segmentControl.setButtonTitles(buttonTitles: ["Favorites","Recent Activity"])
            segmentControl.selectorViewColor = AppDelegate.shared().APP_COLOR
            segmentControl.selectorTextColor = .black// AppDelegate.shared().LABEL_COLOR
            segmentControl.textColor = AppDelegate.shared().LABEL_COLOR
            
            segmentControl.delegate = self
            segmentControl.selectedViewWidth = 25
            segmentControl.selectedViewHeight = 4
            segmentControl.appFont = UIFont(name: "NunitoSans-Regular", size: 16)!
        }
    }


    
    //MARK:------- Variable ---------
    
    var controller :LayerTableVC?
    var selectedIndex = -1
    //MARK:------ View lifecycle ---------
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        //segment control setup
//        segmentControl.segmentStyle = .textOnly
//        segmentControl.insertSegment(withTitle: "Favorites", image: #imageLiteral(resourceName: "mail"), at: 0)
//        segmentControl.insertSegment(withTitle: "Recent Activity", image: #imageLiteral(resourceName: "mobile"), at: 1)
//        segmentControl.selectedSegmentIndex = 0
//        segmentControl.tintColor = AppDelegate.shared().APP_COLOR
//
//        segmentControl.addTarget(self, action: #selector(self.segmentSelected(sender:)), for: .valueChanged)

        NotificationCenter.default.addObserver(self, selector: #selector(setLocation), name: NSNotification.Name(rawValue: Singleton.shared.LOCATION_SELECTED), object: nil)
        
        //set color
        btnSchhedule.backgroundColor = AppDelegate.shared().APP_COLOR
        txtFieldDate.rightPaddingColor = AppDelegate.shared().APP_COLOR
        txtFieldTime.rightPaddingColor = AppDelegate.shared().APP_COLOR


        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool)
    {
        //Update tabbar item image inset
        setImageInset()
    }
    //MARK:----- LGSidemenu delegate -----
    func willShowLeftView(_ leftView: UIView, sideMenuController: LGSideMenuController)
    {
        if let leftVC = sideMenuController.leftViewController as? LeftViewController
        {
            leftVC.tableView.reloadData()
        }
    }
    //MARK:----- Set image inset for tabbar item
    func setImageInset()
    {
        self.tabBarController!.tabBar.items![0].imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.tabBarController!.tabBar.items![1].imageInsets = UIEdgeInsets(top: -30, left: 0, bottom: 0, right: 0)
        self.tabBarController!.tabBar.items![2].imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.tabBarController!.tabBar.items![3].imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)


    }
    //MARK:----- segment control delegate -----
    func change(to index: Int, sender: CustomSegmentedControl)
    {
        self.segmentSelected(sender: sender)
    }

    //MARK:----- Action methods -------
    @objc func actionCalender(sender: UIButton)
    {
        self.viewSchedule.isHidden = false
        
        //============== Show with animation
        self.viewSchedule.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.viewSchedule.alpha = 0
        UIView.animate(withDuration: 0.3, animations:
        {
            self.viewSchedule.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.viewSchedule.alpha = 1
        }) { (true) in
            //   print("Date picker isplay: Done")
        }
    }
    @IBAction func actionSchedule(_ sender: ButtonClass)
    {
        sender.animateTouchUpInside
        {
            //code
            self.txtFieldTime.text = ""
            self.txtFieldDate.text = ""
            
            self.actionClose(UIButton())
        }
    }
    @IBAction func actionClose(_ sender: UIButton)
    {
       self.view.endEditing(true)
        
        sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.3, animations:
            {
            sender.transform = CGAffineTransform(scaleX: 1,y: 1)
        }) { (result) in
            //self.onCompletion("\(self.arr[sender.tag])")
            self.viewSchedule.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.viewSchedule.alpha = 1
            UIView.animate(withDuration: 0.3, animations:
                {
                self.viewSchedule.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                self.viewSchedule.alpha = 0
                self.txtFieldTime.text = ""
                self.txtFieldDate.text = ""
                    
                //self.viewPopup.isHidden = true

            }) { (true) in
            }
        }
    }
    @IBAction func actionDate(_ sender: UIButton)
    {
        //show date picker
        DatePickerView.sharedInstance.show(isDOB: false, isDate: true, viewC: self) { (result) in
            
            self.txtFieldDate.text = result
        }
    }
    @IBAction func actionTime(_ sender: UIButton)
    {
        //show date picker
        DatePickerView.sharedInstance.showTime(isDOB: false, isDate: false, viewC: self) { (result) in
            
            self.txtFieldTime.text = result
        }
    }

    @objc func segmentSelected(sender: CustomSegmentedControl)
    {
        if sender.selectedIndex == 0
        {
          //code
            
        }
        else if sender.selectedIndex == 1
        {
          //code
        }
        else if sender.selectedIndex == 2
        {
          //code
        }

    }
    @objc func actionMenu(sender: UIButton)
    {
        let indexPath = IndexPath(item: sender.tag, section: 0)
        let rectOfCell = tblView.rectForRow(at: indexPath)
        let rectOfCellInSuperview = tblView.convert(rectOfCell, to: tblView.superview)
        "Selected cell frame :::: \(rectOfCellInSuperview)".printOn()
        var isUp = true
        
        if rectOfCellInSuperview.origin.y > UIScreen.main.bounds.height - 176 - 133 {
            isUp = false
        }
            
        
        selectedIndex = sender.tag
        
        showLocationList(btn: sender, arrData: [["name":"Audios"],["name":"Record"],["name":"Schedule"],["name":"Delete"]], isUp: isUp)
        
    }
    @IBAction func actionBack(_ sender: UIButton)
    {
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name(rawValue: Singleton.shared.LOCATION_SELECTED) , object: nil)
        sideMenuController?.delegate = self
        sideMenuController?.showLeftView(animated: true, completionHandler: nil)
//        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSearch(_ sender: UIButton)
    {
    }
    
    //MARK:------- Table view ---------- methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellVideoList") as? CustomCellVideoList
        if cell == nil
        {
            let tempArray = Bundle.main.loadNibNamed("CustomCellVideoList", owner: self, options: nil)!
            cell = tempArray.first as? CustomCellVideoList
        }
        //        let arrTemp = arrNotification[indexPath.row] as! NSDictionary
        //        cell?.lblNotification.text = arrTemp.value(forKey: "name") as! String
        //        cell?.imgDelete.image = arrTemp.value(forKey: "image") as! UIImage
        
        
        cell?.btnHeart.tag = indexPath.row
        cell?.btnHeart.addTarget(self, action: #selector(self.actionMenu(sender:)), for: .touchUpInside)
        
        if selectedIndex == indexPath.row {
            cell?.imgViewHeart.image = #imageLiteral(resourceName: "cross_library")
            
        }else {
            cell?.imgViewHeart.image = #imageLiteral(resourceName: "menu_table")
        }
        cell?.selectedBackgroundView = UIView()
        cell?.backgroundColor = UIColor.clear
        
        //
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
    
    //MARK:- POPOVER Method
    
    func showLocationList(btn:UIView,arrData:Array<Any>,isUp:Bool) {
        
        controller = LayerTableVC(nibName: "LayerTableVC", bundle: nil)
        //Configure the Popover presentation controller
        controller?.modalPresentationStyle = .popover
        controller?.selectedLocation = ""
        controller?.listArray = arrData as NSArray
        
        let layerPickerPresentationController = controller?.presentationController as! UIPopoverPresentationController
        
        layerPickerPresentationController.sourceView = btn.superview
        layerPickerPresentationController.sourceRect = (btn.superview!.bounds)
        if isUp {
            layerPickerPresentationController.permittedArrowDirections = .up
        }else{
            layerPickerPresentationController.permittedArrowDirections = .down

        }
        
        layerPickerPresentationController.backgroundColor = .clear// #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layerPickerPresentationController.delegate = self
        
        let finalDesiredSize:CGSize = CGSize(width: 146, height: arrData.count*44)
        let tempSize:CGSize = CGSize(width: finalDesiredSize.width, height: finalDesiredSize.height + 1)
        controller?.preferredContentSize = tempSize
        controller?.preferredContentSize = finalDesiredSize
       
        present(controller!, animated: true) {
             self.tblView.reloadData()
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    @objc func setLocation(noti:Notification)
    {
        selectedIndex = -1
        self.tblView.reloadData()
        controller?.dismiss(animated: true, completion: nil)
        controller = nil
        
        let jsonDict = noti.object as! NSDictionary
        
        if "\(jsonDict.value(forKey: "name") ?? "")" == "Audios"
        {
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "AudioVC") as! AudioVC
            self.navigationController?.pushViewController(obj, animated: true)
        }
        else if "\(jsonDict.value(forKey: "name") ?? "")" == "Record"
        {
        }
        else if "\(jsonDict.value(forKey: "name") ?? "")" == "Schedule"
        {
            self.actionCalender(sender: UIButton())
        }
        else if "\(jsonDict.value(forKey: "name") ?? "")" == "Delete"
        {
            self.actionCalender(sender: UIButton())
        }
        
    }
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        selectedIndex = -1
        self.tblView.reloadData()
        controller?.dismiss(animated: true, completion: nil)

    }
    
    
}
