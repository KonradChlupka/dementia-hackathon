import SwiftUI

struct MyClubsView: View {
    @EnvironmentObject var userData: UserData
    @State var isPresented = false
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
            .navigationBarItems(trailing:
                
            Button(action: { self.isPresented.toggle() }) {
                HStack(alignment: .center){
                Text("My Activity")
                Image(systemName: "plus")
                    
            }
                .padding(.all, 5.0)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(15)
                .sheet(isPresented: $isPresented, content: { AddActivityView() })
                }
            
            )
                
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
