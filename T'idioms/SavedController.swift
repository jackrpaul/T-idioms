//
//  SavedController.swift
//  T'idioms
//
//  Created by Jack Paul on 2/26/22.
//

import UIKit

class SavedController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var savedTableView: UITableView!
    
    var myTidioms: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedTableView.dataSource = self
        savedTableView.delegate = self
        
        if UserDefaults.standard.object(forKey: "savedTidioms") != nil {
            myTidioms = try! JSONDecoder().decode([String].self, from: UserDefaults.standard.object(forKey: "savedTidioms") as! Data)
        } else {
            ViewController().saveToUserDefaults()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTidioms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = savedTableView.dequeueReusableCell(withIdentifier: "tidiom")!
        cell.textLabel?.text = myTidioms[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailedView" {
            let destination = segue.destination as? DetailViewController
            let tidIndex = savedTableView.indexPathForSelectedRow!.row
        }
    }
    
}
