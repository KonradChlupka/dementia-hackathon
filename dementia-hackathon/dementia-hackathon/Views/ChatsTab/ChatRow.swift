import Foundation
import SwiftUI

struct ChatRow: View {
    var chat: Chat

    var body: some View {
        let size = chat.messages.count

        return
            HStack {
                if chat.id < 20 { // i.e. it's a group chat
                    Image(getActivityImageNameByClubId(clubId: chat.id))
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)

                    VStack(alignment: .leading) {
                        Text(getClubNameByClubId(clubId: chat.id))
                            .bold()
                            .font(.system(size: 18))

                        Text(chat.messages[size - 1].body)
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                    }
                }
                // i.e. it's an individual chat
                else { // TODO: for now threadId is userId, but should be a concatanation of two
                    Image(getUsernameByUserId(userId: chat.id))
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)

                    VStack(alignment: .leading) {
                        Text(getUsernameByUserId(userId: chat.id))
                            .bold()
                            .font(.system(size: 18))

                        Text(chat.messages[size - 1].body)
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                    }
                }
                Spacer()
            }
            .frame(height: 50)
    }
}

func getActivityImageNameByClubId(clubId: Int) -> String {
    var activityId: Int = -1 // TODO: probably can do more elegant solution
    for club in clubData {
        if club.id == clubId {
            activityId = club.activityId
            break
        }
    }
    for activity in activityData {
        if activity.id == activityId {
            return activity.imageName
        }
    }
    return "ERROR" // should never reach here
}

func getClubNameByClubId(clubId: Int) -> String {
    for club in clubData {
        if club.id == clubId {
            return club.name
        }
    }
    return "ERROR"
}

func getUsernameByUserId(userId: Int) -> String {
    for user in userData {
        if user.userId == userId {
            return user.userName
        }
    }
    return "ERROR"
}
