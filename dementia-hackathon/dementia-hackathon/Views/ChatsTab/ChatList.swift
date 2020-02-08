import SwiftUI

struct ChatList: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(chatData) { chat in
                    NavigationLink(destination: Text("Not implemented yet")) {
                        ChatRow(chat: chat)
                    }
                }
            }
            .navigationBarTitle(Text("Chats"))
        }
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
