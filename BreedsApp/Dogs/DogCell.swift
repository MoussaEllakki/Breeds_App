//
//  DogCell.swift
//  BreedsApp
//
//  Created by Moussa El Lakki on 2023-12-13.
//

import UIKit

class DogCell: UITableViewCell {
    
    @IBOutlet weak var dogImage: UIImageView!
    
    var dogImageUrlString: String? {
        didSet {
            dogImage.downloaded(from: dogImageUrlString ?? "")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
