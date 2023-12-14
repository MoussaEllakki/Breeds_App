//
//  FavoriteDogsCell.swift
//  BreedsApp
//
//  Created by Moussa El Lakki on 2023-12-13.
//

import UIKit

class FavoriteDogsCell: UITableViewCell {
    
    @IBOutlet weak var dogBreedTypeLabel: UILabel!
    @IBOutlet weak var dogImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    var dogImageUrlString: String? {
        didSet {
            dogImage.downloaded(from: dogImageUrlString ?? "")
        }
    }
    var dogBreedType: String? {
        didSet {
            self.dogBreedTypeLabel.text = dogBreedType
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
