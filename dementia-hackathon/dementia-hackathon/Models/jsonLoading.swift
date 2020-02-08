import CoreLocation
import SwiftUI
import UIKit

struct Activity: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var isInterested: Bool
}

struct Club: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    var activityId: Int
    var isJoint: Bool
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

struct Message: Codable {
    var emojiOnly: Bool
    var body: String
    var senderId: Int
    var sentAt: String // decode into Date
}

// codable in order to decode from json, Identifiable to create navigation list
struct Chat: Codable, Identifiable {
    var id: Int
    var messages: [Message]
}

struct User: Codable {
    var userId: Int
    var userName: String
    var clubsJoined: [Int]
    var favoriteActivities: [Int]
    var threadsJoined: [Int]
}

func loadShared<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

let clubData: [Club] = loadShared("clubs.json")
let activityData: [Activity] = loadShared("activities.json")
let chatData: [Chat] = loadShared("chats.json")
let userData: [User] = loadShared("users.json")
