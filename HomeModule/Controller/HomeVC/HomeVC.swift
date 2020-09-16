//
//  HomeVC.swift
//  Browcery
//
//  Created by apple on 31/08/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit
import FSPagerView


class HomeVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,FSPagerViewDataSource,FSPagerViewDelegate
{
    //MARK:----- Outlets -----
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var collView2: UICollectionView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var imgViewEditIcon: UIImageView!
    @IBOutlet weak var txtFieldSearch: TextFieldClass!
    @IBOutlet weak var imgViewSearch: UIImageView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var pagerView: FSPagerView!
        {
        didSet
        {
            self.pagerView.register(UINib(nibName:"CustomCellFSPagerView", bundle: Bundle.main), forCellWithReuseIdentifier: "FSPagerViewCell")
            self.pagerView.itemSize = FSPagerView.automaticSize
        }
    }
    @IBOutlet weak var pageControl: FSPageControl!
        {
        didSet
        {
            self.pageControl.numberOfPages = 5
            self.pageControl.contentHorizontalAlignment = .center
            self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            self.pageControl.setFillColor(AppDelegate.shared().APP_COLOR, for: .selected)
            self.pageControl.interitemSpacing = 10
            self.pageControl.setFillColor(#colorLiteral(red: 0.8745098039, green: 0.8745098039, blue: 0.8745098039, alpha: 1), for: .normal)
            
            self.pageControl.setPath(self.circlePath, for: .normal)
            self.pageControl.setPath(self.circlePathSelected, for: .selected)
            
        }
    }
    fileprivate var circlePathSelected: UIBezierPath
    {
        //        let width = self.pageControl.itemSpacing
        //        let height = self.pageControl.itemSpacing
        let rect = CGRect(x: 0, y: 0, width: 10, height: 10)
        //let roundedRect = UIBezierPath(roundedRect: rect, cornerRadius: 5)
        let circle = UIBezierPath(ovalIn: rect)
        
        
        return circle
    }
    fileprivate var circlePath: UIBezierPath
    {
        //        let width = self.pageControl.itemSpacing
        //        let height = self.pageControl.itemSpacing
        let rect = CGRect(x: 0, y: 0, width: 9, height: 9)
        //let roundedRect = UIBezierPath(roundedRect: rect, cornerRadius: 5)
        let circle = UIBezierPath(ovalIn: rect)
        
        return circle
    }
    //MARK:----- Variables -----
    var arrData = Array<Any>()
    
    
    
    //MARK:----- View lifecycle -----
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        //register collection view header XIB
        collView.register(UINib.init(nibName: "CollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableView")
        
        collView.register(UINib.init(nibName: "CustomCellCategory", bundle: nil), forCellWithReuseIdentifier: "CustomCellCategory")
        
        collView2.register(UINib.init(nibName: "CustomCellPagerImages", bundle: nil), forCellWithReuseIdentifier: "CustomCellPagerImages")
        
        
        collView.reloadData()
        
        pagerView.transformer = FSPagerViewTransformer(type: .linear)
        
        let newScale = 0.5+CGFloat(1.0)*0.55
        self.pagerView.itemSize = self.pagerView.frame.size.applying(CGAffineTransform(scaleX: newScale, y: newScale))
        self.pagerView.interitemSpacing = CGFloat(0.5) * 20 // [0 - 20]
        //        self.numberOfItems = Int(roundf(0.5*7.0))
        //            self.pagerView.numberOfPages = numberOfItems
        pagerView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: pagerView.frame.size.height)
        
        pagerView.reloadData()
        
        self.pagerView.reloadData()
        
        //get data from server
        self.homepage()
        
        // Do any additional setup after loading the view.
    }
    // MARK:- FSPagerView DataSource
    public func numberOfItems(in pagerView: FSPagerView) -> Int
    {
        return 5
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell
    {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FSPagerViewCell", at: index) as! CustomCellFSPagerView
        
        //        let dictCell = arrData[index] as! NSDictionary
        
        //        cell.lblTitle?.text = "\(dictCell.value(forKey: "player_name") ?? "")" //+ "\(indexPath.row + 1)"
        
        //        cell?.lblDescription.text = "\(dictCell.value(forKey: "description") ?? "")" //+ "\(indexPath.row + 1)"
        
        //        cell.imgViewPlayer?.sd_setImage(with: URL.init(string: WebserviceCall_Swift.image_url + "\(dictCell.value(forKey: "file_path") ?? "")"), placeholderImage: #imageLiteral(resourceName: "placeholder"))
        
        cell.contentView.backgroundColor = UIColor.clear
        
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int)
    {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int)
    {
        //        if index == self.arrData.count - 1 && index != 0 && self.cur_page_player != self.last_page_player && arrData.count > 0 && arrData.count%10 == 0
        //        {
        //            self.get_my_players()
        //        }
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
    //MARK:------- Table view ---------- methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellSection") as? CustomCellSection
        
        if cell == nil
        {
            let tempArray = Bundle.main.loadNibNamed("CustomCellSection", owner: self, options: nil)!
            cell = tempArray.first as? CustomCellSection
        }
        //        let arrTemp = arrNotification[indexPath.row] as! NSDictionary
        //        cell?.lblNotification.text = arrTemp.value(forKey: "name") as! String
        //        cell?.imgDelete.image = arrTemp.value(forKey: "image") as! UIImage
        
        
        //        cell?.btnHeart.tag = indexPath.row
        //        cell?.btnHeart.addTarget(self, action: #selector(self.actionMenu(sender:)), for: .touchUpInside)
        //
        //        if selectedIndex == indexPath.row {
        //            cell?.imgViewHeart.image = #imageLiteral(resourceName: "cross_library")
        //
        //        }else {
        //            cell?.imgViewHeart.image = #imageLiteral(resourceName: "menu_table")
        //        }
        cell?.collView.tag = indexPath.row
        
        if indexPath.row == 0
        {
            cell?.lblTitle.text = "Shop by category".capitalized
            
            cell?.collView.register(UINib.init(nibName: "CustomCellCategory", bundle: nil), forCellWithReuseIdentifier: "CustomCellCategory")
            cell?.collView.delegate = self
            cell?.collView.dataSource = self
            
            cell?.contentView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9725490196, blue: 0.9843137255, alpha: 1)
        }
        else if indexPath.row == 1
        {
            cell?.lblTitle.text = "Popular Products".capitalized
            cell?.collView.register(UINib.init(nibName: "CustomCellProducts", bundle: nil), forCellWithReuseIdentifier: "CustomCellProducts")
            cell?.collView.delegate = self
            cell?.collView.dataSource = self
            
        }
        else if indexPath.row == 2
        {
            cell?.lblTitle.text = "Recommendation".capitalized
            
            cell?.btnViewAll.setImage(#imageLiteral(resourceName: "forward_green"), for: .normal)
            
            cell?.collView.register(UINib.init(nibName: "CustomCellRecommendation", bundle: nil), forCellWithReuseIdentifier: "CustomCellRecommendation")
            
            cell?.collView.delegate = self
            cell?.collView.dataSource = self
            
        }
        else if indexPath.row == 3
        {
            cell?.btnViewAll.isHidden = true
            
            cell?.lblTitle.text = "Popular".capitalized
            cell?.collView.register(UINib.init(nibName: "CustomCellPopular", bundle: nil), forCellWithReuseIdentifier: "CustomCellPopular")
            cell?.collView.delegate = self
            cell?.collView.dataSource = self
        }
        
        cell?.selectedBackgroundView = UIView()
        cell?.backgroundColor = UIColor.clear
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0
        {
            return 230
        }
        else if indexPath.row == 1
        {
            return 300
        }
        else if indexPath.row == 2
        {
            return 330
        }
        else if indexPath.row == 3
        {
            return 140
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
    
    //MARK:- UICollectionView delegate methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        if collectionView == collView2
        {
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCellPagerImages", for: indexPath) as? CustomCellPagerImages
            if cell == nil
            {
                let tempArray = Bundle.main.loadNibNamed("CustomCellPagerImages", owner: self, options: nil)
                cell = tempArray?.first  as? CustomCellPagerImages
            }
            
            return cell!
        }
        
        if collectionView.tag == 1
        {
            
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCellProducts", for: indexPath) as? CustomCellProducts
            if cell == nil
            {
                let tempArray = Bundle.main.loadNibNamed("CustomCellProducts", owner: self, options: nil)
                cell = tempArray?.first  as? CustomCellProducts
            }
            
            return cell!
        }
        else if collectionView.tag == 2
        {
            
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCellRecommendation", for: indexPath) as? CustomCellRecommendation
            if cell == nil
            {
                let tempArray = Bundle.main.loadNibNamed("CustomCellRecommendation", owner: self, options: nil)
                cell = tempArray?.first  as? CustomCellRecommendation
            }
            
            return cell!
        }
        else if collectionView.tag == 3
        {
            
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCellPopular", for: indexPath) as? CustomCellPopular
            if cell == nil
            {
                let tempArray = Bundle.main.loadNibNamed("CustomCellPopular", owner: self, options: nil)
                cell = tempArray?.first  as? CustomCellPopular
            }
            
            return cell!
        }
        
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCellCategory", for: indexPath) as? CustomCellCategory
        if cell == nil
        {
            let tempArray = Bundle.main.loadNibNamed("CustomCellCategory", owner: self, options: nil)
            cell = tempArray?.first  as? CustomCellCategory
        }
        //          let dictCell = arrData[indexPath.row] as NSDictionary
        //          cell?.lblTitle.text = "\(dictCell["title"] ?? "")"
        //          cell?.lblVideoCount.text = "\(dictCell["subtitle"] ?? "")"
        //          cell?.viewBG.backgroundColor = arrColor[indexPath.row]
        
        cell?.backgroundColor = .clear
        return cell!
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: collectionListView.bounds.size.width/2  , height: (collectionListView.bounds.size.width/2 )/1.2164179)
        
        //let totalCell:CGFloat = 2.0
        //let spaceBetweenCells:CGFloat = 18
        //let dim = ((collectionView.bounds.size.width) - (totalCell - 1) * spaceBetweenCells) / totalCell;
        //let dim = (UIScreen.main.bounds.width - 60)/2
        
        if collectionView == collView2
        {
            return CGSize.init(width: 300, height: 180)
        }
        if collectionView.tag == 1
        {
            return CGSize.init(width: 150, height: 240)
        }
        else if collectionView.tag == 2
        {
            return CGSize.init(width: 280, height: 125)
        }
        else if collectionView.tag == 3
        {
            return CGSize.init(width: 80, height: 80)
        }
        return CGSize.init(width: 86, height: 180)
        
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionReusableView", for: indexPath) as! CollectionReusableView
            //headerView.lblCoinCount.text = "rfrfrfrf"
            //headerView.txtFieldSearch.delegate = self
            headerView.txtFieldSearch.addTarget(self, action: #selector(actionSearch), for: .editingDidEnd)
            return headerView
            
        default:
            
            let vu = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath)
            return vu
        }
    }
    
    //MARK:----- Action methods -----
    @objc func actionSearch(sender:UITextField)
    {
        "Search clicked \(sender.text!)".printOn()
    }
    
    //MARK:----- service calling -----
    func homepage()
    {
        self.view.endEditing(true)
        Loader.sharedInstance.showLoader(msg: Constants.PLEASE_WAIT )// Start Loader
        "Loader Open----------------------------".printOn()
        
        let dict = ["":""]
        
        "Json request-------------------------- \(dict)".printOn()
        
        let service = WebserviceCall_Swift()
        
        DispatchQueue.global(qos: .background).async{
            
            service.callServiceWith(parameterDict: dict, isAuth:true, url: Constants.homepage ,type:"GET", onCompletion: { (sender) in
                DispatchQueue.main.async
                    {
                        Loader.sharedInstance.stopLoader()
                        "Loader Close----------------------------".printOn()
                        if sender.isKind(of: NSString.self)
                        {
                            let error = sender as! String
                            if error == Constants.No_Internet
                            {
                                Singleton.actionShowNetwotkError(compblock: { (txt) in
                                    if txt == "Retry"
                                    {
                                        self.homepage()
                                    }
                                })
                            }
                            else
                            {
                                Singleton.actionShowMessage(message: Constants.SomethingWentWrong)
                            }
                        }
                        else
                        {
                            let arrResult = sender as! NSArray
                            let json = arrResult.object(at: 0) as! NSDictionary
                            
                            if Int("\(json.object(forKey: "status") ?? "0")") == 200
                            {
                                let dictTemp = json.object(forKey: "data")  as! NSDictionary
                                
                                //self.arrData
                                
                                //let arrD = dictTemp.object(forKey: "books") as! NSArray
                                
                                //self.arrData = json.object(forKey: "data")  as! Array
                                
//                                if self.cur_page == 0
//                                {
//                                    self.arrData = arrD as! [Any]
//                                }
//                                else
//                                {
//                                    self.arrData.append(contentsOf: arrD)
//                                }
//                                if arrD.count > 0
//                                {
//                                    self.cur_page = self.cur_page + 1
//                                }
//
//                                if self.arrData.count != 0
//                                {
//                                    self.tblView.restore()
//                                }
//                                else
//                                {
//                                    self.tblView.setEmptyMessage(Constants.NoRecordFound)
//                                }
                                
                                //                                if self.strCheck == "" && self.strRecord == ""
                                //                                {
                                //                                }
                                
                                self.tblView.reloadData()
                            }
                            else if Int("\(json.object(forKey: "status") ?? "0")") == 201
                            {
//                                if self.arrData.count == 0
//                                {
//                                    self.tblView.setEmptyMessage(Constants.NoRecordFound)
//                                }
                                self.tblView.reloadData()
                                
                                //Singleton.actionShowMessage(message: "\(json.object(forKey: "message") ?? "")")
                            }
                            else if Int("\(json.object(forKey: "status") ?? "0")") == 202
                            {
                                Singleton.actionShowMessage(message: "\(json.object(forKey: "message") ?? "")")
                            }
                            else if Int("\(json.object(forKey: "status") ?? "0")") == 203
                            {
                                Singleton.actionShowMessage(message: "\(json.object(forKey: "message") ?? "")")
                            }
                                
                            else
                            {
                                Singleton.actionShowMessage(message: Constants.SomethingWentWrong)
                            }
                        }
                }
            })
        }
    }
    
}
