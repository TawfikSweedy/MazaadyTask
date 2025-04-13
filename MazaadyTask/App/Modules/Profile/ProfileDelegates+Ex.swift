//
//  ProfileDelegates+.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 11/04/2025.
//

import Foundation
import UIKit
//MARK:- extension UITableViewDelegates
extension ProfileViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + (viewModel.adsData?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as! ProductsTableViewCell
            guard let products = viewModel.productsData else { return UITableViewCell() }
            cell.Configure(products: products)
            cell.productsCollectionView.layoutIfNeeded()
            return cell
        } else if indexPath.row == (viewModel.adsData?.count ?? 0) + 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TagsTableViewCell", for: indexPath) as! TagsTableViewCell
            guard let tags = viewModel.tagsData else { return UITableViewCell() }
            cell.Configure(tags: tags)
            cell.tagsCollectionView.layoutIfNeeded()
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
            let ads = viewModel.adsData?[indexPath.row - 1]
            cell.Configure(ad: ads!)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
