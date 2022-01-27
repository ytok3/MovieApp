//
//  MoviesDetailsTableViewCell.swift
//  MoviesAndTVShowsApplication
//
//  Created by Yasemin TOK on 28.12.2021.
//

import UIKit
import Alamofire
import AlamofireImage

class MoviesDetailsTableViewCell: UITableViewCell {
    
    private let randomImage: String = "https://picsum.photos/200"

    @IBOutlet weak var moviesDetailsImageView: UIImageView!
    @IBOutlet weak var moviesDetailsTitle: UILabel!
    @IBOutlet weak var moviesDetailsOriginalTitle: UILabel!
    
    func SaveModelMoviesDetails(model: MoviesDetails) {

        enum EndPoint: String, CaseIterable {
            
            case BASE_URL = "https://image.tmdb.org/t/p"
            case FILE_SIZE = "/w500"
            
        }
        
        let baseUrl = EndPoint.BASE_URL.rawValue
        let fileSize = EndPoint.FILE_SIZE.rawValue
        let imagePath = "\(baseUrl)\(fileSize)\(model.posterPath)"
        
        moviesDetailsImageView.af.setImage(withURL: URL(string: imagePath) ?? URL(string: randomImage)!)
        moviesDetailsTitle.text = model.title
        moviesDetailsOriginalTitle.text = model.originalTitle
    }
}
