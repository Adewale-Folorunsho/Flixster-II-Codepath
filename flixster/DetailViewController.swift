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
    @IBOutlet weak var trackNameLabel: UILabel!

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!

    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()

        Nuke.loadImage(with: movie.artworkUrl100, into: trackImageView)
        trackNameLabel.text = movie.trackName
        artistLabel.text = movie.artistName
        albumLabel.text = movie.collectionName
        genreLabel.text = movie.primaryGenreName

        // Create a date formatter to style our date and convert it to a string
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        releaseDateLabel.text = dateFormatter.string(from: movie.releaseDate)

        // Use helper method to convert milliseconds into `mm:ss` string format
        durationLabel.text = formattedTrackDuration(with: movie.trackTimeMillis)

    }


}
