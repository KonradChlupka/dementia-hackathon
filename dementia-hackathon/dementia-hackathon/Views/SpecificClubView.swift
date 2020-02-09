import SafariServices
import SwiftUI

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
        ScrollView {
            VStack {
                MapView(coordinate: club.locationCoordinate, name: club.name, subtitle: activity.name, movable: true, delta: 0.002)
                    //.edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                    .cornerRadius(10)
                    .padding(.top)

                CircleImage(image: Image(activity.imageName))
                    .offset(y: -130)
                    .padding(.bottom, -130)
                    .padding(.horizontal, 50.0)
                VStack(alignment: .leading) {
                    Text(club.name)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    HStack {
                        Text("Rating:")
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star")
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Image(systemName: "location.fill")
                        .foregroundColor(.blue)

                        Text("15 People Attend")
                    }
                    Button(action: {
                        self.userData.clubs[self.clubIndex].isJoint.toggle()
                }) {
                        if self.userData.clubs[self.clubIndex].isJoint {
                            HStack {
                                Text("Leave").bold().font(.system(size: 20))
                                Image(systemName: "minus.square.fill")
                                // .foregroundColor(Color.yellow)
                            }
                            .frame(width: 100, height: 40)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(15)
                        } else {
                            HStack {
                                Text("Join").bold().font(.system(size: 20))
                                Image(systemName: "plus.app.fill")
                                // .foregroundColor(Color.gray)
                            }
                            .frame(width: 100, height: 40)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(15)
                        }
                    }
                    HStack {
                        Image(systemName: "desktopcomputer")
                            .foregroundColor(Color.gray)
                        Button(action: {
                            let url: String = "https://" + self.club.website

                            // UIApplication.shared.open(url as URL)
                            self.urlString = url
                            self.showSafari = true

                    }) {
                            Text(club.website)
                        }
                        .sheet(isPresented: $showSafari) {
                            SafariView(url: URL(string: self.urlString)!)
                        }
                    }
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color.gray)
                        Button(action: {
                            let tel = "tel://"
                            let formattedString = tel + self.club.telephone
                            let url: NSURL = URL(string: formattedString)! as NSURL

                            UIApplication.shared.open(url as URL)

                    }) {
                            Text(club.telephone)
                        }
                    }
                    Text("Timetable")
                        .bold()
                        .font(.system(size: 20))
                    ForEach(club.days, id: \.self) { day in
                        HStack {
                            Text(day + ":")
                            .font(.system(size: 20))
                            Spacer()
                            ForEach(self.club.times, id: \.self) { time in
                                ClubTimeButton(time: time)
                            }
                        }
                    }
                    .padding(.vertical, 4.0)
                }
                Spacer()
            }
            .navigationBarTitle(Text(club.name), displayMode: .inline)
            .padding(.horizontal, 7.0)
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}

struct SpecificClubView_Previews: PreviewProvider {
    static var previews: some View {
        SpecificClubView(club: clubData[0], activity: activityData[0])
            .environmentObject(UserData())
    }
}
