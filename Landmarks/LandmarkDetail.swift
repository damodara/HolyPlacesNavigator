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
                
            Spacer()
            
            ButtonDirection(landmark: landmark)
//            Button (
//                    action: {
//                        let latitude:CLLocationDegrees = self.landmark.locationCoordinate.latitude
//                        let longitude:CLLocationDegrees = self.landmark.locationCoordinate.longitude
//                    
//                    let regionDistance:CLLocationDistance = 1000;
//                    let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
//                    let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
//                    
//                    let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
//                    
//                    let placemark = MKPlacemark(coordinate: coordinates)
//                    let mapItem = MKMapItem(placemark: placemark)
//                        mapItem.name = self.landmark.name
//                    mapItem.openInMaps(launchOptions: options)
//                }) {
//                HStack{
//                    Text("Get directions")
//                        .font(.body)
//                    Image(systemName:"arrow.up.right.diamond")
//                        .font(.headline)
//                }
//                .padding()
//                .background(Color(UIColor.systemBackground))
//                .cornerRadius(40)
//                .shadow(radius: 10)
//            }
//            .padding(.top)
            
                
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
            .previewDevice("iPhone 12 Pro Max")
            
            
    }
}
