//
//  SubRedditTableViewCell.swift
//  RedditC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

class SubRedditTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var redditImageView: UIImageView!
    
    
    var subreddit: LRLSubreddit?{
        didSet{
            updateView()
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
    func updateView(){
        titleLabel.text = subreddit?.title
        likeCountLabel.text = "Likes: \(subreddit?.likeCount ?? 0)"
        commentCountLabel.text = "Comments: \(subreddit?.commentCount ?? 0)"
        redditImageView.image = subreddit?.photo
    }
    
    

}
