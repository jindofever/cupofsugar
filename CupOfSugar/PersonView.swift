//
//  PersonView.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/13/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import UIKit

protocol PersonViewDelegate {
    func goToPerson(person: String)
}

class PersonView: UIView {

    var delegate: PersonViewDelegate?
    
    
    init(frame: CGRect, name: String, photo: UIImage, distance: String) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 241/255.0, green: 136/255.0, blue: 43/255.0, alpha: 1.0)
        
        let nameLabel = UILabel(frame: CGRect(x: 70, y: 5, width: 10, height: 10))
        nameLabel.font = UIFont(name: "GeosansLight", size: 15)
        nameLabel.text = name
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.sizeToFit()
        nameLabel.textAlignment = .Left
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
