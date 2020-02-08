import SwiftUI

struct CategoryButton: View {
    @EnvironmentObject var userData: UserData
    @State var isPresented = false
    var activity: Activity

    var body: some View {
        Button(action: { self.isPresented.toggle() }) {
            Text(activity.name).bold().font(.system(size: 35))
        }
        // .padding(10.0)
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 200)
        .background(Image(activity.imageName).resizable().scaledToFill().blur(radius: 3))
        .foregroundColor(Color.white)
        .cornerRadius(30)
        .sheet(isPresented: $isPresented, content: { ClubView(activity: self.activity).environmentObject(self.userData) })
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton(activity: activityData[0])
    }
}
