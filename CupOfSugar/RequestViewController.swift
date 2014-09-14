//
//  RequestViewController.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/13/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController, RequestViewDelegate {

    var firstName: String?
    var requestedItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let requestView = RequestView(frame: self.view.bounds, firstName: self.firstName!, requestedItem: self.requestedItem!)
        requestView.delegate = self
        
        self.view.addSubview(requestView)
    }

    func request(personFirstName: String) {
        println("attempting to set push notification to \(personFirstName)")
        
        //var myFirstName: String = PFUser.currentUser().objectForKey("firstname") as NSString
        
        let nameSearchQuery = PFUser.query()
        nameSearchQuery.whereKey("firstname", equalTo: personFirstName)

        let query = PFInstallation.query()
        query.whereKey("user", matchesQuery: nameSearchQuery)

        let informationDictionary = ["alert": "Kashish would like to borrow some \(requestedItem!)!", "requestedItem" : requestedItem!, "firstName" : "Kashish"]
        
        let push = PFPush()
        push.setQuery(query)
        push.setData(informationDictionary)
        push.sendPushInBackground()
    }
}
