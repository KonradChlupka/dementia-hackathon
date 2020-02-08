import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var activities = activityData
    @Published var clubs = clubData
}
