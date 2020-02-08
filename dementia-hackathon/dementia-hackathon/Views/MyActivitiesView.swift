import SwiftUI

struct MyActivitiesView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        NavigationView {
            List {
                ForEach(userData.activities) { activity in
                    if activity.isInterested || areAnyClubsJoint(activity1: activity, userData: self.userData) {
                        MyActivityCategoryButton(activity: activity)
                    }
                }
            }
            .navigationBarTitle(Text("My Activities"))
        }
    }
}

func areAnyClubsJoint(activity1: Activity, userData: UserData) -> Bool {
    for club in userData.clubs {
        for activity in userData.activities {
            if activity1 == activity {
                if club.activityId == activity.id {
                    if club.isJoint {
                        return true
                    }
                }
            }
        }
    }
    return false
}

struct MyActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        MyActivitiesView()
            .environmentObject(UserData())
    }
}
