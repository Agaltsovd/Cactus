//
//  SessionListViewController.swift
//  Cactus
//
//  Created by Daniyar Agaltsov on 8/1/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class SessionListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var tableView: UITableView!
    
  

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sessions"
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SessionsStorage.shared.sessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sessionCell = tableView.dequeueReusableCell(withIdentifier: "session_cell", for: indexPath) as! SessionsListTableViewCell
        
        let session = SessionsStorage.shared.sessions[indexPath.row]
        sessionCell.configure(with: session)
        
        return sessionCell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")

        SessionsStorage.shared.sessions.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
    
    

   

}
