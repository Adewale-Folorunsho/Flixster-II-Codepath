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
        
        Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/original/" + movie.poster_path)!, into: trackImageView)
        overviewLabel.text = movie.overview
        titleLabel.text = movie.original_title
        ratingLabel.text = String(movie.vote_average)
        dateLabel.text = String(movie.release_date)

//        // Create a date formatter to style our date and convert it to a string
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        releaseDateLabel.text = dateFormatter.string(from: movie.releaseDate)
//
//        // Use helper method to convert milliseconds into `mm:ss` string format
//        durationLabel.text = formattedTrackDuration(with: movie.trackTimeMillis)

    }


}
