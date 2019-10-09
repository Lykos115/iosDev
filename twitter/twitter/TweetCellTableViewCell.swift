//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Lykøs on 9/30/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var TweetContent: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweet: UIButton!
    
    @IBAction func FavTweet(_ sender: Any) {
        let tobefavorited = !favorited
        
        if (tobefavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetId, success: {
                self.setFavorited(true)
            }, failure: { (Error) in
                print("Favorite did not succeed: \(Error)")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetId, success: {
                self.setFavorited(false)
            }, failure: { (Error) in
                print("Unf  avorite did not succeed: \(Error)")
            })
        }
    }
    @IBAction func retweetAction(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetID: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (Error) in
            print("Retweet error: \(Error)")
        })
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted) {
            retweet.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweet.isEnabled = false;
        }else{
            retweet.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweet.isEnabled = true;
        }
    }
    
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    
    func setFavorited(_ isFavorited:Bool){
        favorited = isFavorited
        if (isFavorited) {
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
