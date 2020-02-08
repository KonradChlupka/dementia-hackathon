import SwiftUI

struct ClubView: View {
    @EnvironmentObject var userData: UserData
    @State var isPresented = false

    var activity: Activity

    var activityIndex: Int {
        userData.activities.firstIndex(where: { $0.id == activity.id })!
    }

    var body: some View {
        VStack {
            NavigationView {
                List(getClubsByActivity(activity: self.activity)) { club in
                    VStack( /* alignment: .center */ ) {
                        Text(club.name).bold()
                        PlaceButton(club: club, activity: self.activity)
                    }
                }
                .navigationBarTitle("\(activity.name)" + " Places")
            }
            Button(action: {
                self.userData.activities[self.activityIndex].isInterested.toggle()
            }) {
                if self.userData.activities[self.activityIndex].isInterested {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(Color.gray)
                }
                // Text("Interested in "+"\(activity.name)").bold().font(.system(size: 20))
            }
            .frame(minWidth: 100, minHeight: 70)
            .padding(.horizontal, 50)
            .padding(.vertical, 10)
            // .background(Color.purple)
            .foregroundColor(Color.purple)
            .cornerRadius(30)
        }
    }
}

func getClubsByActivity(activity: Activity) -> [Club] {
    var clubs: [Club] = []
    for club in clubData {
        if club.activityId == activity.id {
            clubs.append(club)
        }
    }
    return clubs
}

struct ClubView_Previews: PreviewProvider {
    static var previews: some View {
        ClubView(activity: activityData[2])
            .environmentObject(UserData())
    }
}
