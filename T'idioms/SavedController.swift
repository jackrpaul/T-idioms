//
//  SavedController.swift
//  T'idioms
//
//  Created by Jack Paul on 2/26/22.
//

import UIKit

class SavedController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var savedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedTableView.dataSource = self
        savedTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = savedTableView.dequeueReusableCell(withIdentifier: "tidiom")!
        cell.textLabel?.text = "Name of a saved T'idiom"
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailedView" {
            let destination = segue.destination as? DetailViewController
            let tidIndex = savedTableView.indexPathForSelectedRow!.row
        }
    }
    
}
