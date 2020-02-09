import SwiftUI

struct MyActivityCategoryButton: View {
    @EnvironmentObject var userData: UserData
    @State var isPresented = false
    var activity: Activity

    var body: some View {
        Button(action: { self.isPresented.toggle() }) {
            Text(activity.name).bold().font(.system(size: 35))
        }
        // .padding(10.0)
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 200)
            .background(Image(activity.imageName).resizable().scaledToFill().blur(radius: 3).colorMultiply(.gray))
        .foregroundColor(Color.white)
        .cornerRadius(30)
            .sheet(isPresented: $isPresented, content: { ClubView(activity: self.activity).environmentObject(self.userData) })
    }
}

struct MyActivityCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        MyActivityCategoryButton(activity: activityData[0])
    }
}
