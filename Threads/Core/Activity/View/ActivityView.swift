import SwiftUI
import CoreLocationUI
import MapKit

struct ActivityView: View {
    @StateObject private var viewModel = ActivityViewModel()

    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $viewModel.region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: .constant(.follow))
                .ignoresSafeArea()
                .tint(.pink)

            Button(action: {
                viewModel.requestLocationPermission()
            }) {
                Image(systemName: "location.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.pink)
                    .clipShape(Circle())
                    .padding(.bottom, 50)
            }
        }
        .onAppear {
            viewModel.checkLocationAuthorization()
        }
    }
}

