//
//  SimilarMoviesViewController.swift
//  flixster
//
//  Created by wale on 3/12/23.
//

import UIKit
import Nuke

class SimilarMoviesViewController: UIViewController , UICollectionViewDataSource{

    var movies: [Movie] = []
    var movieId = 0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a search URL for fetching albums (`entity=album`)
        collectionView.dataSource = self
        let url = URL(string: "https://api.themoviedb.org/3/movie/"+String(movieId)+"/recommendations?api_key=40bc027665dfe203490794907e15ed9a")!
        
//        let url = URL(string: "https://api.themoviedb.org/3/movie/1035806/similar?api_key=40bc027665dfe203490794907e15ed9a")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(MovieSearchResponse.self, from: data)
                let movies = response.results
                print(movies)
                DispatchQueue.main.async {

                    // Set the view controller's tracks property as this is the one the table view references
                    self?.movies = movies

                    // Make the table view reload now that we have new data
                    self?.collectionView.reloadData()
                }
            } catch {
                print("❌ Error parsing JSON: \(error)")
            }
        }

        // Initiate the network request
        task.resume()
        
        collectionView.dataSource = self

        // Get a reference to the collection view's layout
        // We want to dynamically size the cells for the available space and desired number of columns.
        // NOTE: This collection view scrolls vertically, but collection views can alternatively scroll horizontally.
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 4

        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 4

        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 3

        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

        // Set the size that each tem/cell should display at
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimilarCell", for: indexPath) as! SimilarCell

        // Use the indexPath.item to index into the albums array to get the corresponding album
        let movie = movies[indexPath.item]

        // Get the artwork image url
        let imageUrl = movie.poster_path

        // Set the image on the image view of the cell
        if movie.poster_path != nil{
            Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w500/" + imageUrl!)!, into: cell.movieImageView)
            return cell
        }
        return cell
    }


}
