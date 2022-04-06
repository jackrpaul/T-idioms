//
//  DetailViewController.swift
//  T'idioms
//
//  Created by Jack Paul on 2/26/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tidiom: UILabel!
    var dvTitle = "testing"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tidiom.text = dvTitle
    }
    
}
