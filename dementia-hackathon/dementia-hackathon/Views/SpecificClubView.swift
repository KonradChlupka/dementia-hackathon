import SwiftUI

struct SpecificClubView: View {
    @EnvironmentObject var userData: UserData
    var club: Club
    var activity: Activity

    var clubIndex: Int {
        userData.clubs.firstIndex(where: { $0.id == club.id })!
    }

    var body: some View {
        VStack {
            MapView(coordinate: club.locationCoordinate, name: club.name, subtitle: activity.name, movable: true, delta: 0.002)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage(image: Image(activity.imageName))
                .offset(x: 0, y: -130)
                .padding([.leading, .trailing])
                .padding(.bottom, -125.0)

            VStack( /* alignment: .leading */ ) {
                Text(club.name)
                    .font(.title)
                    .multilineTextAlignment(.center)
                HStack(alignment: .top) {
                    Text(activity.name)
                        .font(.subheadline)
                    Button(action: {
                        self.userData.clubs[self.clubIndex].isJoint.toggle()
                    }) {
                        if self.userData.clubs[self.clubIndex].isJoint {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
            }
            // .padding()
            Spacer()
        }
    }
}

struct SpecificClubView_Previews: PreviewProvider {
    static var previews: some View {
        SpecificClubView(club: clubData[0], activity: activityData[0])
            .environmentObject(UserData())
    }
}
