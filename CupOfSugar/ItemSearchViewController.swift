//
//  ItemSearchViewController.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/13/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import UIKit

class ItemSearchViewController: UIViewController, ItemSearchViewDelegate, PersonViewDelegate {

    var requestingItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let itemSearchView = ItemSearchView(frame: self.view.bounds)
        itemSearchView.delegate = self
        
        self.view.addSubview(itemSearchView)
    }

    func search(input: String) {
        println("searching with string \(input)")
        self.requestingItem = input
        
        // HARD CODED - FIX IF THERE IS TIME
        
        let cathyView = PersonView(frame: CGRect(x: 15, y: 120, width: 290, height: 60), firstName: "Cathy", photo: UIImage(), distance: "0.3")
        cathyView.delegate = self
        
        let charlesView = PersonView(frame: CGRect(x: 15, y: 200, width: 290, height: 60), firstName: "Charles", photo: UIImage(), distance: "0.5")
        charlesView.delegate = self
        
        let kashishView = PersonView(frame: CGRect(x: 15, y: 280, width: 290, height: 60), firstName: "Kashish", photo: UIImage(), distance: "1.3")
        kashishView.delegate = self
        
        self.view.addSubview(cathyView)
        self.view.addSubview(charlesView)
        self.view.addSubview(kashishView)
    }
    
    func goToPerson(personFirstName: String) {
        println("presenting RequestViewController for \(personFirstName)")
        
        let requestViewController = RequestViewController()
        requestViewController.firstName = personFirstName
        requestViewController.requestedItem = requestingItem
        
        self.presentViewController(requestViewController, animated: true, completion: nil)
    }
}
