//
//  ProductCollectionViewCell.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 11/04/2025.
//

import UIKit
//MARK:- UICollectionViewCell
class ProductCollectionViewCell: UICollectionViewCell {
    //MARK:- @IBOutlets
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var lotStartsInStackView: UIStackView!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var redDisCountLabel: UILabel!
    //MARK:- override func
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    //MARK:- funcs
    func Configure(product : ProductsModel ) {
        self.productImg.SDImage(URL(string: product.image ?? ""))
        self.productName.text = product.name
        self.productPrice.text = "\(product.price ?? 0) \(product.currency ?? "")"
        self.offerLabel.text = "\(product.offer ?? 0) \(product.currency ?? "")"
        self.redDisCountLabel.text = "\(product.price ?? 0 - (product.offer ?? 0)) \(product.currency ?? "")"
        self.daysLabel.text = "\(product.end_date?.timeParts.days ?? 0)"
        self.minutesLabel.text = "\(product.end_date?.timeParts.minutes ?? 0)"
        self.hoursLabel.text = "\(product.end_date?.timeParts.hours ?? 0)"
        product.offer == nil ? (lotStartsInStackView.isHidden = true) : (lotStartsInStackView.isHidden = false)
    }
    

}
