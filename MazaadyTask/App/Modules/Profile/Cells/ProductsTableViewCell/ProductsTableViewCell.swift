//
//  ProductsTableViewCell.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 10/04/2025.
//

import UIKit
//MARK:- UITableViewCell
class ProductsTableViewCell: UITableViewCell {
    //MARK:- @IBOutlets
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    //MARK:- variables
    var observe : NSKeyValueObservation?
    var products : [ProductsModel]?
    //MARK:- override func
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        productsCollectionView.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    //MARK:- funcs
    func setupCollectionView() {
        let layout = StaggeredLayout()
        layout.numberOfColumns = 3
        productsCollectionView.setCollectionViewLayout(layout, animated: false)
        
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        productsCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
        observe = productsCollectionView.observe(\.contentSize) { (tableView, _) in
            self.collectionViewHeight.constant = self.productsCollectionView.contentSize.height
        }
        
        productsCollectionView.reloadData()
    }
    
    func Configure(products : [ProductsModel]) {
        self.products = products
    }
    
}
//MARK:- UICollectionViewDelegates
extension ProductsTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        let model = (products?[indexPath.row])!
        cell.Configure(product: model)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: products?[indexPath.row].offer != nil ? 400 : 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
