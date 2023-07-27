//
//  LocationOperator.swift
//  WheatherSwiftUI
//
//  Created by Oleksandr on 25.07.2023.
//

import Foundation
import CoreLocation


class LocationOperator: NSObject, ObservableObject {
    
    // - MARK: Structs
    
    enum Status {
        case process, finished
    }
    
    // - MARK: Properties
    
    
    static var shared = LocationOperator()
    
    private let manager = CLLocationManager()
    
    private var locationUpdated: Bool = false
    
    private var userCoordinate: CLLocationCoordinate2D!
    
    var cityName: String?
    
    @Published var operatorStatus: Status = .process
    
    
    // - MARK: Init
    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
    }
    
    
    // - MARK: Actions
    // if needed
    
    
    
}



// - MARK: CLLocationManagerDelegate

extension LocationOperator: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            operatorStatus = .process
            manager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            operatorStatus = .finished
        case .authorizedAlways:
            manager.startUpdatingLocation()
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
        case .authorized:
            manager.startUpdatingLocation()
        default:
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locationUpdated, let currentLocation = locations.last else { return }
        userCoordinate = currentLocation.coordinate
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(currentLocation) { placemarks, error in
            guard error == nil, let placemark = placemarks?[0]
            else {
                print(error!.localizedDescription)
                return
            }
            
          //  let area = placemark.administrativeArea ?? ""
          //  let code = placemark.postalCode ?? ""
            let locality = placemark.locality
          //  let streatName = placemark.thoroughfare ?? ""
           // let streatNumber = placemark.subThoroughfare ?? ""
          //  let adress = "\(streatNumber) \(streatName), \(locality), \(area) \(code)"
            
            self.cityName = locality
            self.locationUpdated = true
            self.operatorStatus = .finished
        }
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        operatorStatus = .finished
        print(error.localizedDescription)
    }
    
}
