//
//  ViewController.swift
//  BreedsApp
//
//  Created by Moussa El Lakki on 2023-12-12.
//

import UIKit


class BreedsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    let breedsViewModel = BreedsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        breedsViewModel.fetchDogBreeds {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breedsViewModel.breeds.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constance.breedCel, for: indexPath)
        cell.textLabel?.text =  breedsViewModel.breeds[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBreed = breedsViewModel.breeds[indexPath.row]
        performSegue(withIdentifier: Constance.breedListSeque, sender: selectedBreed)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constance.breedListSeque {
            if let breedListViewController = segue.destination as? DogsViewController,
               let selectedBreed = sender as? String {
                breedListViewController.breedTittle = selectedBreed
            }
        }
    }
}


