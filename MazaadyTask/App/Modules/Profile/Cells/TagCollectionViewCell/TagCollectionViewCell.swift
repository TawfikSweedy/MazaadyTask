//
//  TagCollectionViewCell.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 13/04/2025.
//

import UIKit
//MARK:- UICollectionViewCell
class TagCollectionViewCell: UICollectionViewCell {
    //MARK:- @IBOutlets
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var tagTitleLabel: UILabel!
    //MARK:- override func
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- func
    func Configure(tag : Tags , isSelected: Bool = false) {
        tagTitleLabel.text = tag.name
        if isSelected {
            tagView.backgroundColor = UIColor(.lightPrimary)
            tagTitleLabel.textColor = .orange
            self.tagTitleLabel?.font = UIFont(name: "Nunito-Bold", size: 14)
            tagView.layer.borderColor = UIColor(named: "orange_color")?.cgColor
        } else {
            tagView.backgroundColor = .white
            tagTitleLabel.textColor = .black
            self.tagTitleLabel?.font = UIFont(name: "Nunito-Regular", size: 14)
            tagView.layer.borderColor = UIColor(.border).cgColor
        }
    }

}
