import SwiftUI

struct MyClubPlaceButton: View {
    @EnvironmentObject var userData: UserData
    @State var isPresented = false
    var activity: Activity
    var club: Club

    var body: some View {
        Button(action: { self.isPresented.toggle() }) {
            Text(club.name).bold().font(.system(size: 25))
        }
        // .padding(10.0)
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 200)
            .background(Image(activity.imageName).resizable().scaledToFill().blur(radius: 3).colorMultiply(.gray))
        .foregroundColor(Color.white)
        .cornerRadius(30)
        .sheet(isPresented: $isPresented, content: { SpecificClubView(club: self.club, activity: self.activity).environmentObject(self.userData) })
    }
}

struct MyClubPlaceButton_Previews: PreviewProvider {
    static var previews: some View {
        MyClubPlaceButton(activity: activityData[1], club: clubData[1]).environmentObject(UserData())
    }
}
