//
//  ProductDescriptionVC.swift
//  Browcery
//
//  Created by wvmac2 on 31/08/20.
//  Copyright © 2020 Mac-4. All rights reserved.
//

import UIKit

class ProductDescriptionVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var imgViewHeart: UIImageView!
    @IBOutlet weak var imgViewProduct: UIImageView!
    @IBOutlet weak var collViewImage: UICollectionView!
    @IBOutlet weak var collViewRecommendation: UICollectionView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblWeightAndPrice: UILabel!
    @IBOutlet weak var lblDiscountedPrice: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        collViewImage.register(UINib.init(nibName: "CustomCCellImages", bundle: nil), forCellWithReuseIdentifier: "CustomCCellImages")
        collViewRecommendation.register(UINib.init(nibName: "CustomCCellRecommendation", bundle: nil), forCellWithReuseIdentifier: "CustomCCellRecommendation")
        collViewImage.contentInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionBack(_ sender: Any) {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func actionFilter(_ sender: Any) {
    }
    @IBAction func actionHeart(_ sender: Any) {
        
    }
    @IBAction func actionAdd(_ sender: Any) {
    }
    
    
    //MARK:- UICollectionView delegate methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collViewImage {
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCCellImages", for: indexPath) as? CustomCCellImages
            if cell == nil
            {
                let tempArray = Bundle.main.loadNibNamed("CustomCCellImages", owner: self, options: nil)
                cell = tempArray?.first  as? CustomCCellImages
            }
            
            
            return cell!
        }
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCCellRecommendation", for: indexPath) as? CustomCCellRecommendation
        if cell == nil
        {
            let tempArray = Bundle.main.loadNibNamed("CustomCCellRecommendation", owner: self, options: nil)
            cell = tempArray?.first  as? CustomCCellRecommendation
        }
        
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //let dictCell = self.arrData[0] as! NSDictionary
        if collectionView == collViewImage {
            return 4
        }
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: collectionListView.bounds.size.width/2  , height: (collectionListView.bounds.size.width/2 )/1.2164179)
        if collectionView == collViewImage {
            let totalCell:CGFloat = 2.0
            let spaceBetweenCells:CGFloat = 0
            let dim = ((collectionView.bounds.size.width) - (totalCell - 1) * spaceBetweenCells) / totalCell;
            return CGSize.init(width: 44, height: 44)
        }
        
        return CGSize.init(width: 300, height: 120)
        
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
        return 5
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
