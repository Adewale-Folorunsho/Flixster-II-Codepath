//
//  DetailViewController.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/5/22.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!

    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        if movie.poster_path != nil{
            Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/original/" + movie.poster_path!)!, into: trackImageView)
        }
        overviewLabel.text = movie.overview
        titleLabel.text = movie.original_title
        ratingLabel.text = String(movie.vote_average)
        dateLabel.text = String(movie.release_date)
    }
    
    @IBAction func tapTitle(_ sender: UITapGestureRecognizer) {
        print("tapped")
        if let tappedView = sender.view {
            performSegue(withIdentifier: "similarMovieSegue", sender: tappedView)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let similarMoviesViewController = segue.destination as? SimilarMoviesViewController
        similarMoviesViewController?.movieId = movie.id
    }
}
