//
//  BreedListViewController.swift
//  BreedsApp
//
//  Created by Moussa El Lakki on 2023-12-12.
//

import UIKit

class DogsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var breedsTittleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let dogsViewModel = DogsViewModel ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogsViewModel.fetchdogsImageUrls(completion: {
            DispatchQueue.main.async {
                self.breedsTittleLabel.text = self.breedTittle
                self.tableView.reloadData()
            }
        }, breedTittle: self.breedTittle!)
    }
    
    var breedTittle: String? {
        didSet {}
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogsViewModel.dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dogCell = tableView.dequeueReusableCell(withIdentifier:Constance.dogCell , for: indexPath) as! DogCell
        
        dogCell.dogImage.layer.cornerRadius = 20
        dogCell.dogImage.clipsToBounds = true
        dogCell.dogImageUrlString = dogsViewModel.dogs[indexPath.row].imageUrlString
        return dogCell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDogImageUrl = dogsViewModel.dogs[indexPath.row].imageUrlString
        addDogToFavorite(dogImageUrlString: selectedDogImageUrl)
        performSegue(withIdentifier:Constance.favoriteDogsSegue, sender: nil)
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
    
    func addDogToFavorite(dogImageUrlString : String){
        
        //Avoid adding duplicate images to the favorite list
        if !FavoriteDogsViewModel.shared.favoriteDogs.contains(where: { $0.imageUrlString == dogImageUrlString }) {
            let dog = Dog(imageUrlString: dogImageUrlString, dogBreedType: self.breedTittle ?? "" )
            FavoriteDogsViewModel.shared.favoriteDogs.append(dog)
        }
    }
}








