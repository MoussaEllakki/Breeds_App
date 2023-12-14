//
//  FavoriteDogsViewController.swift
//  BreedsApp
//
//  Created by Moussa El Lakki on 2023-12-13.
//

import UIKit

class FavoriteDogsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var dogCountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dogCountLabel.text = "\(FavoriteDogsViewModel.shared.favoriteDogs.count)"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoriteDogsViewModel.shared.favoriteDogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let favoriteDogCell = tableView.dequeueReusableCell(withIdentifier: Constance.favoriteDogsCell, for: indexPath) as! FavoriteDogsCell
        
        favoriteDogCell.dogImage.layer.cornerRadius = 20
        favoriteDogCell.dogImage.clipsToBounds = true
        
        favoriteDogCell.dogImageUrlString = FavoriteDogsViewModel.shared.favoriteDogs[indexPath.row].imageUrlString
        favoriteDogCell.dogBreedType = FavoriteDogsViewModel.shared.favoriteDogs[indexPath.row].dogBreedType
        return favoriteDogCell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(decideHeightCell())
    }
    
    //Dynamic height for the table view cell based on the device type
    func decideHeightCell() -> Int{
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 400
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            return 1100
        } else {
            return 400
        }
    }
}
