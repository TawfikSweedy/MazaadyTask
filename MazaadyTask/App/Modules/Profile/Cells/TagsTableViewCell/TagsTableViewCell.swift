//
//  TagsTableViewCell.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 13/04/2025.
//

import UIKit
//MARK:- TagsTableViewCell
class TagsTableViewCell: UITableViewCell {
    //MARK:- @IBOutlets
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    //MARK:- Variables
    var observe : NSKeyValueObservation?
    var tags : [Tags]?
    var selectedIndex = 0
    //MARK:- override func
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCollectionView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tagsCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK:- funcs
    func setupCollectionView() {
        tagsCollectionView.delegate = self
        tagsCollectionView.dataSource = self
        tagsCollectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")
        
        if let layout = tagsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            layout.minimumLineSpacing = 8
            layout.minimumInteritemSpacing = 8
            layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
        
        tagsCollectionView.layoutIfNeeded()
        
        observe = tagsCollectionView.observe(\.contentSize) { (tableView, _) in
            self.collectionViewHeight.constant = self.tagsCollectionView.contentSize.height
        }
        
        tagsCollectionView.reloadData()
    }
    
    func Configure(tags : [Tags]) {
        self.tags = tags
    }
   
    
}
//MARK:- extension UICollectionViewDelegates
extension TagsTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as! TagCollectionViewCell
        let model = (tags?[indexPath.row])!
        cell.Configure(tag: model, isSelected: indexPath.row == selectedIndex)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        tagsCollectionView.reloadData()
    }
}
