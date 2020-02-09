import Foundation
import SwiftUI
import UIKit

struct ChatView: View {
    var chat: Chat
    var meId: Int // id of the person using the phone
    @State private var temp: String = ""

    var body: some View {
        VStack {
            List {
                ForEach(chat.messages) { message in
                    MessageView(messageBody: message.body, iAmSender: message.senderId == self.meId, sender: getUserOrClubNameFromChatId(id: message.senderId), groupChat: self.chat.id < 20)
                }
            }
            .navigationBarTitle(Text(getUserOrClubNameFromChatId(id: chat.id)), displayMode: .inline)
            .onAppear { UITableView.appearance().separatorStyle = .none }
            Spacer()
            TextField("", text: $temp)
                .font(.system(size: 15))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .offset(y: -5)
                .padding(.horizontal, 20.0)
        }
        .onTapGesture {
            UIApplication.shared.keyWindow!.endEditing(true)
        }
    }
}

struct MessageView: View {
    var messageBody: String
    var iAmSender: Bool
    var sender: String
    var groupChat: Bool

    var body: some View {
        if iAmSender {
            return AnyView(HStack {
                Spacer(minLength: 40)
                Text(self.messageBody)
                    .font(.system(size: 18))
                    .padding(8.0)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(15)
            })
        } else {
            if groupChat {
                return AnyView(HStack(alignment: .bottom) {
                    Image(sender)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .cornerRadius(15)
                    VStack(alignment: .leading) {
                        Text(sender)
                            .font(.system(size: 16))
                            .foregroundColor(Color.gray)
                        Text(self.messageBody)
                    }
                    .font(.system(size: 18))
                    .padding(8.0)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(15)
                    Spacer(minLength: 30)
                }
                .offset(x: -10))
            } else {
                return AnyView(HStack {
                    Text(self.messageBody)
                        .font(.system(size: 18))
                        .padding(8.0)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(15)
                    Spacer(minLength: 40)
                })
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chat: chatData[0], meId: 1002)
    }
}

func getUserOrClubNameFromChatId(id: Int) -> String {
    print(id)
    var name = "ERROR"
    // it's a club
    if id < 20 {
        for club in clubData {
            if club.id == id {
                name = club.name
            }
        }
    }
    // it's an individual
    else {
        for user in userData {
            if user.userId == id {
                name = user.userName
            }
        }
    }
    return name
}
