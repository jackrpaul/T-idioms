//
//  DetailViewController.swift
//  T'idioms
//
//  Created by Jack Paul on 2/26/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tidiom: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tidiom.text = ""
    }
    
}
