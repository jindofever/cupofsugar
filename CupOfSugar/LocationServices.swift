//
//  LocationServices.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/13/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import Foundation
extension AppDelegate {
    func initLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 25
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var locationsArray = locations as NSArray
        location = locationsArray.lastObject as? CLLocation
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        manager.stopUpdatingLocation()
    }
}
