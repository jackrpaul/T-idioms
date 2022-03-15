//
//  NetworkManager.swift
//  T'idioms
//
//  Created by Jack Paul on 3/15/22.
//

import Foundation

class NetworkManager {
    func fetchWords() {
        // Set the URL the request is being made to.
        let request = URLRequest(url: NSURL(string: "https://random-word-api.herokuapp.com/word?number=10")! as URL)
        do {
            // Perform the request
            var response: AutoreleasingUnsafeMutablePointer<URLResponse?>? = nil
            let data = try NSURLConnection.sendSynchronousRequest(request, returning: response)

            // Convert the data to JSON
            let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]

            if let json = jsonSerialized, let url = json["url"], let explanation = json["explanation"] {
                print(url)
                print(explanation)
            }
        }
        catch {
            print(error)
        }
    }
}
