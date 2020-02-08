import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    @State private var selection = 0

    // .singleLine important for chats!
    init() {
        UITableView.appearance().separatorStyle = .none
    }

    var body: some View {
        TabView(selection: $selection) {
            ChatList()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "message.fill")
                        Text("Chats")
                    }
                }
                .onAppear { UITableView.appearance().separatorStyle = .singleLine }
                .tag(0)

            MyClubsView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.3.fill")
                        Text("My Clubs")
                    }
                }
                .onAppear { UITableView.appearance().separatorStyle = .none }
                .tag(1)

            MyActivitiesView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("My Activities")
                    }
                }
                .onAppear { UITableView.appearance().separatorStyle = .none }
                .tag(2)

            ExploreView()
                .tabItem {
                    VStack {
                        Image(systemName: "wand.and.stars.inverse")
                        Text("Explore")
                    }
                }
                .onAppear { UITableView.appearance().separatorStyle = .none }
                .tag(3)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
