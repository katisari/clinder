//
//  ViewController.swift
//  Clinder
//
//  Created by Katie  Lee on 7/12/18.
//  Copyright © 2018 Katie  Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageDisplayed: UIImageView!
    var items: [NSDictionary] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://svcs.ebay.com/services/search/FindingService/v1?SECURITY-APPNAME=KatieLee-Clinder-PRD-d8bb87cdf-e186980c&OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&RESPONSE-DATA-FORMAT=JSON&callback=_cb_findItemsByKeywords&REST-PAYLOAD&keywords=iPhone7&paginationInput.entriesPerPage=2&GLOBAL-ID=EBAY-US&siteid=0")
        // create a URLSession to handle the request tasks
        let session = URLSession.shared
        // create a "data task" to make the request and run completion handler
        let task = session.dataTask(with: url!, completionHandler: {
            // see: Swift closure expression syntax
            data, response, error in
            // data -> JSON data, response -> headers and other meta-information, error-> if one occurred
            // "do-try-catch" blocks execute a try statement and then use the catch statement for errors
            do {
                // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    print(jsonResult)
                }
            } catch {
                print(error)
            }
        })
        // execute the task and then wait for the response
        // to run the completion handler. This is async!
        task.resume()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let dest =
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func noButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func yesButtonPressed(_ sender: UIButton) {
    }
    

}

