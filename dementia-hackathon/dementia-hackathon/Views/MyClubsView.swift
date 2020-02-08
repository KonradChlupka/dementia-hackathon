import SwiftUI

struct MyClubsView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        NavigationView {
            List {
                ForEach(userData.clubs) { club in
                    if club.isJoint {
                        MyClubPlaceButton(activity: getActivityFromClub(club: club), club: club)
                    }
                }
            }
            .navigationBarTitle(Text("My Clubs"))
        }
    }
}

func getActivityFromClub(club: Club) -> Activity {
    for activity in activityData {
        if activity.id == club.activityId {
            return activity
        }
    }
    return activityData[0]
}

struct MyClubsView_Previews: PreviewProvider {
    static var previews: some View {
        MyClubsView()
            .environmentObject(UserData())
    }
}
