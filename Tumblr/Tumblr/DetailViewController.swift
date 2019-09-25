//
//  DetailViewController.swift
//  Tumblr
//
//  Created by Lykøs on 9/24/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {
     var post: [String: Any]!
    @IBOutlet weak var imageShow: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let photos = post["photos"] as! [[String: Any]]
        let photo = photos[0]
        
        // 2.
        let originalSize = photo["original_size"] as! [String: Any]
        // 3.
        let urlString = originalSize["url"] as! String
        // 4.
        let url = URL(string: urlString)
        imageShow.af_setImage(withURL: url!)
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
