//
//  Location.swift
//  chargeme
//
//  Created by Paul Okuda on 4/12/15.
//  Copyright (c) 2015 Paul Okuda. All rights reserved.
//

import Foundation
import CoreLocation


class Location {
    let locationManager = CLLocationManager();
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.requestWhenInUseAuthorization();
    locationManager.startUpdatingLocation();
    
    class func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error) -> Void in
            if (error != nil) {
                println("Error:" + error.localizedDescription);
                return;
            }
            if (placemarks.count > 0){
                let pm = placemarks[0] as CLPlacemark;
                self.displayLocationInfo(pm);
            }
            else {
                println("Error with data");
            }
        })
    }
    
    class func displayLocationInfo(placemark: CLPlacemark) {
        let locationManager = CLLocationManager();
        self.locationManager.stopUpdatingLocation();
        var location = placemark.location;
        
        //        println(placemark.location);
        //        println(distance);
        //        ParseGeoPoint point = new ParseGeoPoint(30.0, -20,0);
        let point = PFGeoPoint(latitude: placemark.location.coordinate.latitude, longitude: placemark.location.coordinate.longitude);
        //        let distance = point.distanceFromLocation(point);
        //        println(distance);
        println(point.distanceInMilesTo(point));
        
        
        if (PFUser.currentUser() != nil){
            PFUser.currentUser().setValue(point, forKey: "location");
            PFUser.currentUser().saveEventually();
            println("successfuly saved latitude to parse");
        }
        else {
            println("user is nil");
        }
        //        println(placemark.location);
        //        var locationString = String(location);
        //        println(placemark.location.coordinate.latitude);
        //        println(placemark.location.coordinate.longitude);
        //        println(placemark.locality)
        //        println(placemark.postalCode)
        //        println(placemark.location);
        //        println(placemark.subLocality);
        //        println(placemark.locality);
    }
    
    class func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error: " + error.localizedDescription);
    }
    

}