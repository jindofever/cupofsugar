//
//  PersonView.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/13/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import UIKit

protocol PersonViewDelegate {
    func goToPerson(personFirstName: String)
}

class PersonView: UIView {

    var delegate: PersonViewDelegate?
    var firstName: String?
    
    init(frame: CGRect, firstName: String, photo: UIImage, distance: String) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 241/255.0, green: 136/255.0, blue: 43/255.0, alpha: 1.0)
        self.firstName = firstName
        
        let roundedPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 5)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = roundedPath.CGPath
        
        self.layer.mask = maskLayer
        
        let personImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        personImage.image = UIImage(named: firstName.lowercaseString)
        
        let distanceLabel = UILabel(frame: CGRect(x: 70, y: 5, width: 10, height: 10))
        distanceLabel.font = UIFont(name: "GeosansLight", size: 15)
        distanceLabel.text = distance + " miles away"
        distanceLabel.textColor = UIColor.whiteColor()
        distanceLabel.sizeToFit()
        distanceLabel.textAlignment = .Left
        
        let nameLabel = UILabel(frame: CGRect(x: 70, y: 20, width: 10, height: 10))
        nameLabel.font = UIFont(name: "GeosansLight", size: 30)
        nameLabel.text = firstName
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.sizeToFit()
        nameLabel.textAlignment = .Left
        
        let selectButton = UIButton(frame: CGRect(x: 220, y: 0, width: 70, height: 60))
        selectButton.backgroundColor = UIColor(red: 30/255.0, green: 190/255.0, blue: 0, alpha: 1.0)
        let selectTitle = NSAttributedString(string: "select", attributes: [NSFontAttributeName: UIFont(name: "GeosansLight", size: 30), NSForegroundColorAttributeName: UIColor.whiteColor()])
        selectButton.setAttributedTitle(selectTitle, forState: .Normal)
        selectButton.addTarget(self, action: Selector("goToPerson"), forControlEvents: .TouchUpInside)

        self.addSubview(personImage)
        self.addSubview(distanceLabel)
        self.addSubview(nameLabel)
        self.addSubview(selectButton)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func goToPerson() {
        if let firstName = self.firstName {
            self.delegate?.goToPerson(firstName)
        }
        else {
            println("ERROR: firstName not defined.")
        }
    }
    
}
