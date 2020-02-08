import SwiftUI

struct PlaceButton: View {
    @EnvironmentObject var userData: UserData
    @State var isPresented = false
    var club: Club
    var activity: Activity

    var body: some View {
        Button(action: { self.isPresented.toggle() }) {
            Text("")
        }
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 200)
        .padding()
        .background(MapView(coordinate: club.locationCoordinate, name: club.name, subtitle: activity.name, movable: false, delta: 0.006)
            .edgesIgnoringSafeArea(.top)
        )
        .cornerRadius(40)

        .sheet(isPresented: $isPresented, content: { SpecificClubView(club: self.club, activity: self.activity).environmentObject(self.userData) })
    }
}

struct PlaceButton_Previews: PreviewProvider {
    static var previews: some View {
        PlaceButton(club: clubData[0], activity: activityData[0])
    }
}
