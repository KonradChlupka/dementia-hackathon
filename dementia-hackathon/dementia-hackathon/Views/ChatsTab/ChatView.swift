import SwiftUI

struct ChatView: View {
    var chat: Chat
    var meId: Int // id of the person using the phone

    var body: some View {
        List {
            ForEach(chat.messages) { message in
                Text("test")
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chat: chatData[0], meId: 1002)
    }
}
