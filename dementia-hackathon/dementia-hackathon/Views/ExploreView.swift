import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var userData: UserData
    // @State var isPresented = false

    var body: some View {
        NavigationView {
            List(activityData) { activity in
                CategoryButton(activity: activity)
            }
            .navigationBarTitle("Explore Categories").foregroundColor(Color.black)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .environmentObject(UserData())
    }
}
