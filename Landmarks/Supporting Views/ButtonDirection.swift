//
//  ButtonDirection.swift
//  HP Navigator
//
//  Created by ddas on 11.11.2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI
import MapKit

struct ButtonDirection: View {
    var landmark: Landmark
    
    var body: some View {
        Button (
                action: {
                    let latitude:CLLocationDegrees = self.landmark.locationCoordinate.latitude
                    let longitude:CLLocationDegrees = self.landmark.locationCoordinate.longitude
                
                let regionDistance:CLLocationDistance = 1000;
                let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
                let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
                
                let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
                
                let placemark = MKPlacemark(coordinate: coordinates)
                let mapItem = MKMapItem(placemark: placemark)
                    mapItem.name = self.landmark.name
                mapItem.openInMaps(launchOptions: options)
            }) {
            HStack{
                Text(NSLocalizedString("Get directions", comment: "название кнопки прокладывания маршрута"))
                    .font(.body)
                Image(systemName:"arrow.up.right.diamond")
                    .font(.headline)
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(40)
            .shadow(radius: 10)
        }
        .padding(.top)
    }
}

struct ButtonDirection_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDirection(landmark: landmarkData[0])
    }
}
