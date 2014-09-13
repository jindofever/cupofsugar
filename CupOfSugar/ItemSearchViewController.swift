//
//  ItemSearchViewController.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/13/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import UIKit

class ItemSearchViewController: UIViewController, ItemSearchViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let itemSearchView = ItemSearchView(frame: self.view.bounds)
        itemSearchView.delegate = self
        
        self.view.addSubview(itemSearchView)
    }

    func search(input: String) {
        println("searching with string \(input)")
        
        
    }
    

}
