//
//  SubRedditTableViewController.swift
//  RedditC
//
//  Created by Levi Linchenko on 12/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

class SubRedditTableViewController: UITableViewController {
    
    @IBOutlet weak var redditSearchBar: UISearchBar!
    
    var subreddits: [LRLSubreddit]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redditSearchBar.delegate = self

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subreddits?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subRedditCell", for: indexPath) as? SubRedditTableViewCell
        let subReddit = subreddits?[indexPath.row]
        cell?.subreddit = subReddit

        // Configure the cell...

        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
 

}

extension SubRedditTableViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text else {return}
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        LRLSubredditClient.fetchAllSubReddits(forTitle: searchText) { (subreddits) in
            guard let subreddits = subreddits else {return}
            self.subreddits = subreddits
            for subredditt in subreddits{
                dispatchGroup.enter()
                LRLSubredditClient.fetchImageData(forURL: subredditt.imageURLString, with: { (data) in
                    guard let data = data else {return}
                    let photo = UIImage(data: data)
                    subredditt.photo = photo
                    dispatchGroup.leave()
                })
            }
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
}
