//
//  ViewController.swift
//  T'idioms
//
//  Created by Jack Paul on 2/22/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var createdTidiom: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        createdTidiom.text = ""
    }
    
    
    @IBAction func createTidiom(_ sender: Any) {
        NetworkManager().fetchWords()
        
        createdTidiom.alpha = 0
        createdTidiom.text = "this town ain't big enough for the both of us, partner"
        UIView.animate(withDuration: 1.0, animations: {self.createdTidiom.alpha = 1}, completion: {_ in })
    }
    
/**
 T'idioms is an app that will allow users to generate a "t'idiom", which is short for a "Texas idiom". Many Texans have ridiculous and nearly meaningless idioms which they use within conversations. T'idioms aims to create a service which will allow the rest of us to also have the opportunity to use over-the-top statements in everyday conversation.
 
 What I will need to research is more on UserDefaults to allow users to save their T'idioms. Correctly implementing this so that users can access their saved T'idioms will likely be the lion's share of my work for this project. Additionally, I am looking to implement functionality for users to share their T'idioms (via iMessage, social media, etc.) through the generic "share" menu that many iOS apps use. This will probably also take a decent amount of time to get working. Additionally, I will need a lot of practice with adding constraints, because these were definitely frustrating to use while making this mockup.
 
 I am excited to begin this project, and can't wait to start working on the proof of concept!
 */

}

