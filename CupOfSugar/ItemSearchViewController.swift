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
        cathyView.alpha = 0
        
        let charlesView = PersonView(frame: CGRect(x: 15, y: 200, width: 290, height: 60), firstName: "Charles", photo: UIImage(), distance: "0.5")
        charlesView.delegate = self
        charlesView.alpha = 0
        
        self.view.addSubview(cathyView)
        self.view.addSubview(charlesView)
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            cathyView.alpha = 1
            charlesView.alpha = 1
        })
    }
    
    func goToPerson(personFirstName: String) {
        println("presenting RequestViewController for \(personFirstName)")
        
        let requestViewController = RequestViewController()
        requestViewController.firstName = personFirstName
        requestViewController.requestedItem = requestingItem
        
        self.presentViewController(requestViewController, animated: true, completion: nil)
    }
}
