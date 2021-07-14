import SwiftUI
import MapKit

struct LandmarkDetail: View {
    var landmark: Landmark

    var body: some View {
        ScrollView{
            VStack {
            
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            
            
            
            
            
            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)

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
                    Text("Get directions")
                    Image(systemName:"arrow.up.right.diamond")
                        .renderingMode(.template)
                        .imageScale(.large)
                        .scaledToFill() // add if you need
                        .frame(width: 50.0, height: 50.0) // as per your requirement
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(/*@START_MENU_TOKEN@*/14.0/*@END_MENU_TOKEN@*/)
            }
            .shadow(radius: 5)
            
            
                
                
                
                
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)

                HStack(alignment: .top) {
//                    Text(landmark.park)
//                        .font(.subheadline)
                    Spacer()
                    Text(landmark.city)
                        .font(.subheadline)
                }
                
                
                Text(landmark.description)
                    .font(.body)
                    .padding(.top, 10.0)
                    
            }
            .padding()

            Spacer()
        }
            .navigationBarTitle(Text(landmark.name), displayMode: .inline)
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
            
            
    }
}
