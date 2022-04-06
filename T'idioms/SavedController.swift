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
            myTidioms = try! JSONDecoder().decode([Tidiom].self, from: UserDefaults.standard.object(forKey: "savedTidioms") as! Data)
        } else {
            ViewController().saveToUserDefaults()
        }
        savedTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTidioms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = savedTableView.dequeueReusableCell(withIdentifier: "tidiom")!
        cell.textLabel?.text = myTidioms[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            myTidioms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailView" {
            let destination = segue.destination as? DetailViewController
            let tidIndex = savedTableView.indexPathForSelectedRow!.row
            
            destination?.dvTitle = myTidioms[tidIndex].title
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
