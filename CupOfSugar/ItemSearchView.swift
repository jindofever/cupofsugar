//
//  ItemSearchView.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/13/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import UIKit

protocol ItemSearchViewDelegate {
    func search(input: String)
}

class ItemSearchView: UIView, UITextFieldDelegate {

    var delegate: ItemSearchViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let background = UIImageView(frame: self.bounds)
        background.image = UIImage(named: "background")
        
        let searchField = UIImageView(frame: CGRect(x: 15, y: 40, width: 290, height: 35))
        searchField.image = UIImage(named: "search-field")
        
        let searchTextField = UITextField(frame: CGRect(x: 55, y: 39, width: 250, height: 33.5))
        searchTextField.font = UIFont(name: "GeosansLight", size: 28)
        searchTextField.textColor = UIColor.blackColor()
        searchTextField.backgroundColor = UIColor.clearColor()
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Search for an item", attributes: [NSFontAttributeName: UIFont(name: "GeosansLight", size: 28), NSForegroundColorAttributeName : UIColor(red: 160/255.0, green: 160/255.0, blue: 160/255.0, alpha: 1.0)])
        searchTextField.returnKeyType = .Search
        searchTextField.autocorrectionType = .No
        searchTextField.delegate = self
        
        self.addSubview(background)
        self.addSubview(searchField)
        self.addSubview(searchTextField)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.delegate?.search("butter")
        textField.resignFirstResponder()
        return true
    }

}
