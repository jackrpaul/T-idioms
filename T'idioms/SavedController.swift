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
        
        if UserDefaults.standard.object(forKey: "savedTidioms") != nil {
            ViewController().myTidioms = try! JSONDecoder().decode([String].self, from: UserDefaults.standard.object(forKey: "savedTidioms") as! Data)
            print("decoding userdefaults")
        } else {
            ViewController().saveToUserDefaults()
        }
        savedTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController().myTidioms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = savedTableView.dequeueReusableCell(withIdentifier: "tidiom")!
        cell.textLabel?.text = ViewController().myTidioms[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailedView" {
            let destination = segue.destination as? DetailViewController
            let tidIndex = savedTableView.indexPathForSelectedRow!.row
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.savedTableView.indexPathForSelectedRow{
            self.savedTableView.deselectRow(at: index, animated: true)
        }
        savedTableView.reloadData()
        ViewController().saveToUserDefaults()
    }
    
}
