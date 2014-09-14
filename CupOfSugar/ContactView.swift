//
//  ContactView.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/14/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import UIKit

protocol ContactViewDelegate {
    func sms(firstName: String, phoneNumber: String, requestedItem: String)
    func call(phoneNumber: String)
    func getDirections(address: CLLocationCoordinate2D)
}

class ContactView: UIView {

    var firstName: String?
    var requestedItem: String?
    var phoneNumber: String?
    var location: PFGeoPoint?
    
    var delegate: ContactViewDelegate?
    
    
    init(frame: CGRect, firstName: String, requestedItem: String) {
        super.init(frame: frame)
        
        self.firstName = firstName
        self.requestedItem = requestedItem
        
        println("searching query with firstname \(self.firstName)")
        
        let background = UIImageView(frame: self.bounds)
        background.image = UIImage(named: "background")
        
        let header = UIImageView(frame: CGRect(x: 0, y: 28, width: 320, height: 50))
        header.image = UIImage(named: "header")
        
        let requestingLabel = UILabel(frame: CGRect(x: 62, y: 85, width: 10, height: 10))
        requestingLabel.font = UIFont(name: "GeosansLight", size: 35)
        requestingLabel.text = "requests"
        requestingLabel.textColor = UIColor(red: 241/255.0, green: 136/255.0, blue: 43/255.0, alpha: 1.0)
        requestingLabel.sizeToFit()
        requestingLabel.center.x = self.center.x
        
        self.addSubview(background)
        self.addSubview(header)
        self.addSubview(requestingLabel)
        
        let query = PFUser.query()
        
        query.whereKey("firstname", equalTo: self.firstName)
        
        query.getFirstObjectInBackgroundWithBlock { (user: PFObject!, error: NSError?) -> Void in
            if (error == nil) {
                let firstName: String = user.objectForKey("firstname") as NSString
                let lastName: String = user.objectForKey("lastname") as NSString
                let fullName = firstName + " " + lastName
                let image: UIImage? = UIImage(named: firstName.lowercaseString)
                self.phoneNumber = user.objectForKey("phonenumber") as NSString
                self.location = user.objectForKey("location") as? PFGeoPoint
                
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
                
                let requestedItemLabel = UILabel(frame: CGRect(x: 62, y: 125, width: 10, height: 10))
                requestedItemLabel.font = UIFont(name: "GeosansLight", size: 35)
                requestedItemLabel.text = requestedItem
                requestedItemLabel.textColor = UIColor(red: 241/255.0, green: 136/255.0, blue: 43/255.0, alpha: 1.0)
                requestedItemLabel.sizeToFit()
                requestedItemLabel.center.x = self.center.x
                self.addSubview(requestedItemLabel)
                
                let smsButton = UIButton(frame: CGRect(x: 55, y: 450, width: 60, height: 60))
                smsButton.setBackgroundImage(UIImage(named: "sms"), forState: .Normal)
                smsButton.setBackgroundImage(UIImage(named: "sms-highlighted"), forState: .Highlighted)
                smsButton.addTarget(self, action: Selector("sms"), forControlEvents: .TouchUpInside)
                self.addSubview(smsButton)
                
                let callButton = UIButton(frame: CGRect(x: 137.5, y: 450, width: 60, height: 60))
                callButton.setBackgroundImage(UIImage(named: "call"), forState: .Normal)
                callButton.setBackgroundImage(UIImage(named: "call-highlighted"), forState: .Highlighted)
                callButton.addTarget(self, action: Selector("call"), forControlEvents: .TouchUpInside)
                self.addSubview(callButton)
                
                let directionsButton = UIButton(frame: CGRect(x: 220, y: 450, width: 45, height: 60))
                directionsButton.setBackgroundImage(UIImage(named: "directions"), forState: .Normal)
                directionsButton.setBackgroundImage(UIImage(named: "directions-highlighted"), forState: .Highlighted)
                directionsButton.addTarget(self, action: Selector("getDirections"), forControlEvents: .TouchUpInside)
                self.addSubview(directionsButton)
                
            }
            else {
                println("ERROR: couldn't retrieve object with firstName \(self.firstName!)")
            }
        }
        
    }
    
    func sms() {
        self.delegate?.sms(self.firstName!, phoneNumber: self.phoneNumber!, requestedItem: self.requestedItem!)
    }
    
    func call() {
        self.delegate?.call(self.phoneNumber!)
    }
    
    func getDirections() {
        if let location = self.location {
            let endAddress = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            self.delegate?.getDirections(endAddress)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


