//
//  AdTableViewCell.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 12/04/2025.
//

import UIKit
//MARK:- UITableViewCell
class AdTableViewCell: UITableViewCell {
    //MARK:- @IBOutlets
    @IBOutlet weak var img: UIImageView!
    //MARK:- override func
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK:- funcs
    func Configure(ad : Advertisements ) {
        self.img.SDImage(URL(string: ad.image ?? ""))
    }
    
}
