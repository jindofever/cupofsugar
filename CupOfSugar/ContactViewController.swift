//
//  ContactViewController.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/14/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, ContactViewDelegate, MFMessageComposeViewControllerDelegate, UINavigationControllerDelegate {

    var firstName: String?
    var requestedItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("launching ContactViewController with firstName \(firstName)")
        
        if let firstName = self.firstName {
            if let requestedItem = self.requestedItem {
                let contactView = ContactView(frame: self.view.bounds, firstName: firstName, requestedItem: requestedItem)
                contactView.delegate = self
                
                self.view.addSubview(contactView)
            }
        }
    }

    func sms(firstName: String, phoneNumber: String, requestedItem: String) {
        let messageController = MFMessageComposeViewController()
        messageController.messageComposeDelegate = self
        messageController.recipients = [phoneNumber]
        messageController.body = "Hi \(firstName)! I'd like to share your \(requestedItem.lowercaseString). Are you interested?"
        
        self.presentViewController(messageController, animated: true, completion: nil)
    }
    
    func call(phoneNumber: String) {
        UIApplication.sharedApplication().openURL(NSURL(string: "telprompt://" + phoneNumber))
    }
    
    func getDirections(address: CLLocationCoordinate2D) {
        let endPlacemark = MKPlacemark(coordinate: address, addressDictionary: nil)
        MKMapItem.openMapsWithItems([MKMapItem.mapItemForCurrentLocation(), MKMapItem(placemark: endPlacemark)], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
