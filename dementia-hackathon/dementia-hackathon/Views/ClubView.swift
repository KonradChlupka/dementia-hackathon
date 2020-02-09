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
                
                List() {
                    Text(activity.description).font(.subheadline)
                    Text("")
                    ForEach(getClubsByActivity(activity: self.activity)){ club in
                    VStack(alignment: .center) {
                        Text(club.name).bold().font(.system(size: 21))
                        PlaceButton(club: club, activity: self.activity)
                    }
                    }
                    
                }
                .navigationBarTitle("\(activity.name)" + " Places")
            }
            HStack{
                Text("Want to do").bold().font(.system(size: 20))
            Button(action: {
                self.userData.activities[self.activityIndex].isInterested.toggle()
            }) {
               if self.userData.activities[self.activityIndex].isInterested {
                   Image(systemName: "star.fill")
                       .foregroundColor(.yellow)

                } else {
                    Image(systemName: "star")
                        .foregroundColor(.gray)
                        //.foregroundColor(Color.gray)
                    
                }
                // Text("Interested in "+"\(activity.name)").bold().font(.system(size: 20))
            }
            }
            
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
