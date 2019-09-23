//
//  DetialsViewController.swift
//  flix
//
//  Created by Lykøs on 9/20/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import UIKit
import AlamofireImage

class DetialsViewController: UIViewController {
    
    var movie: [String:Any]!

    @IBOutlet weak var backdrop: UIImageView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(movie["title"])
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit();
        synopsis.text = movie["overview"] as? String
        synopsis.sizeToFit()
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        poster.af_setImage(withURL: posterURL!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        backdrop.af_setImage(withURL: backdropURL!)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
