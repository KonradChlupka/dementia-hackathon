import SwiftUI
import SafariServices

struct SpecificClubView: View {
    @EnvironmentObject var userData: UserData
    var club: Club
    var activity: Activity
    @State var showSafari = false
    @State var urlString = ""

    var clubIndex: Int {
        userData.clubs.firstIndex(where: { $0.id == club.id })!
    }

    var body: some View {
        ScrollView{
        VStack{
            MapView(coordinate: club.locationCoordinate, name: club.name, subtitle: activity.name, movable: true, delta: 0.002)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage(image: Image(activity.imageName))
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading){
                Text(club.name)
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Text(club.description)
                        .font(.subheadline)
                    .padding([.top, .leading, .trailing], 2.0)
                    .frame(height: 110.0)
            }
            Spacer()
        }
        .navigationBarTitle(Text(club.name), displayMode: .inline)
    }
    }
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}



struct SpecificClubView_Previews: PreviewProvider {
    static var previews: some View {
        SpecificClubView(club: clubData[0], activity: activityData[0])
            .environmentObject(UserData())
    }
}
