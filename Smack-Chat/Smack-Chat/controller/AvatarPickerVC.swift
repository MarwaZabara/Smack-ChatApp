//
//  AvatarPickerVC.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/23/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
  
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var Choice: UISegmentedControl!
    //Variables
    var Avatar_Type = AvatarType.dark

    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.delegate = self
        CollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell{
        cell.ConfigureCell(index: indexPath.row, Type:Avatar_Type)
            return cell
            
        }
    
       else{
       return AvatarCell()
        }
        }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var NumberofColomns : CGFloat = 3
        if UIScreen.main.bounds.width > 320.0 {
            NumberofColomns = 4
        }
        let padding : CGFloat = 20.0
        let spacing : CGFloat = (NumberofColomns-1)*10
        let Dimension : CGFloat = (CollectionView.bounds.width - padding - spacing) / NumberofColomns
        return CGSize(width: Dimension, height: Dimension)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        DataService.instance.SetAvatarName(Name: "\(Avatar_Type)\(indexPath.item)")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func BackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func SegmentChanged(_ sender: Any) {
        if Choice.selectedSegmentIndex == 0{
            Avatar_Type = .dark
        }
        else{
            Avatar_Type = .light
        }
        CollectionView.reloadData()
    }
    
    
    

}
    


