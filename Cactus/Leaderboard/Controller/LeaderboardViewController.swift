//
//  LeaderboardViewController.swift
//  Cactus
//
//  Created by Daniyar Agaltsov on 8/1/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class LeaderboardViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Leaderboard"
        
       
    }
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           
           tableView.reloadData()
       }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        LeadersStorage.shared.leaders.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leaderCell = tableView.dequeueReusableCell(withIdentifier: "leaderboard_cell", for: indexPath) as! LeaderboardTableViewCell
        let leader = LeadersStorage.shared.leaders[indexPath.row]
        leaderCell.configure(with: leader)
        
        return leaderCell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showLeader", sender: nil)
    }
    

    

}
