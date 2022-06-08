//
//  File.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/05/30.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject , CLLocationManagerDelegate {

    let locationManager =  CLLocationManager()
    var latitude: Double?
     var longitude: Double?
    
    override init() {
        super.init()
        
        // 위치에대한 사용자 권한 요청
        locationManager.delegate = self
        //승인시 실행됨
        if CLLocationManager.locationServicesEnabled(){
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            latitude = locationManager.location?.coordinate.latitude
            longitude = locationManager.location?.coordinate.longitude

           
        }
    }
   
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
//            locationP = locations.first?.coordinate
            print("\(latitude), \(longitude)허허허")
            print("이거되는건가?")
            
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            locationManager.stopUpdatingLocation()
            print("왜때문에 에러가 난걸까?: \(error.localizedDescription)")
        }
        
    }



