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
    
    @IBAction func shareTidiom(_ sender: Any) {
        let text = tidiom.text!
        
        let sharedText = [ text ]
        let activityViewController = UIActivityViewController(activityItems: sharedText, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
