//
//  RequestView.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/13/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import UIKit

protocol RequestViewDelegate {
    func request(personFirstName: String)
}

class RequestView: UIView {

    var firstName: String?
    
    var delegate: RequestViewDelegate?
    
    init(frame: CGRect, firstName: String, requestedItem: String) {
        super.init(frame: frame)
        
        self.firstName = firstName
        
        let background = UIImageView(frame: self.bounds)
        background.image = UIImage(named: "background")
        
        let header = UIImageView(frame: CGRect(x: 0, y: 28, width: 320, height: 50))
        header.image = UIImage(named: "header")
        
        let requestingLabel = UILabel(frame: CGRect(x: 62, y: 85, width: 10, height: 10))
        requestingLabel.font = UIFont(name: "GeosansLight", size: 35)
        requestingLabel.text = "You are requesting"
        requestingLabel.textColor = UIColor(red: 241/255.0, green: 136/255.0, blue: 43/255.0, alpha: 1.0)
        requestingLabel.sizeToFit()
        requestingLabel.center.x = self.center.x
        
        let requestedItemLabel = UILabel(frame: CGRect(x: 62, y: 125, width: 10, height: 10))
        requestedItemLabel.font = UIFont(name: "GeosansLight", size: 35)
        requestedItemLabel.text = requestedItem
        requestedItemLabel.textColor = UIColor(red: 241/255.0, green: 136/255.0, blue: 43/255.0, alpha: 1.0)
        requestedItemLabel.sizeToFit()
        requestedItemLabel.center.x = self.center.x
        
        self.addSubview(background)
        self.addSubview(header)
        self.addSubview(requestingLabel)
        self.addSubview(requestedItemLabel)
        
        let query = PFUser.query()
        
        query.whereKey("firstname", equalTo: self.firstName)
        query.getFirstObjectInBackgroundWithBlock { (user: PFObject!, error: NSError?) -> Void in
            if (error == nil) {
                let firstName: String = user.objectForKey("firstname") as NSString
                let lastName: String = user.objectForKey("lastname") as NSString
                let fullName = firstName + " " + lastName
                let image:UIImage? = UIImage(named: firstName.lowercaseString)
                
                let nameLabel = UILabel(frame: CGRect(x: 70, y: 35, width: 10, height: 10))
                nameLabel.font = UIFont(name: "GeosansLight", size: 32)
                nameLabel.text = fullName
                nameLabel.sizeToFit()
                nameLabel.center.x = self.center.x
                nameLabel.textColor = UIColor.whiteColor()
                self.addSubview(nameLabel)
                
                let imageView = UIImageView(frame: CGRect(x: 55, y: 180, width: 210, height: 210))
                imageView.image = image
                self.addSubview(imageView)
                
                let requestButton = UIButton(frame: CGRect(x: 55, y: 450, width: 210, height: 65))
                requestButton.setBackgroundImage(UIImage(named: "request-button"), forState: .Normal)
                requestButton.setBackgroundImage(UIImage(named: "request-button-highlighted"), forState: .Highlighted)
                requestButton.addTarget(self, action: Selector("request"), forControlEvents: .TouchUpInside)
                self.addSubview(requestButton)
            }
            else {
                println("ERROR: couldn't retrieve object with firstName \(self.firstName!)")
            }
        }
    }

    func request() {
        self.delegate?.request(self.firstName!)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
