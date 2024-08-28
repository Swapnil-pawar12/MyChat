import SwiftUI

struct CustomTabBar: View {
    @State private var selectedTab = 0
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                selectedTab = 1
            }) {
                ZStack {
                    Image("HomeTab")
                        .frame(width: 60, height: 60)
                }
            }
            .padding(.bottom, 20)
            Spacer()
            Button(action: {
                selectedTab = 1 // Navigate to AddView when pressed
            }) {
                ZStack {
                    Image("PaymentTab")
                        .frame(width: 60, height: 60)

                }
            }
            .padding(.bottom, 20)
            
            Spacer()
            Button(action: {
                selectedTab = 1 // Navigate to AddView when pressed
            }) {
                ZStack {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 60, height: 60)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }
            .padding(.bottom, 40)
            Spacer()
            Button(action: {
                selectedTab = 1 
            }) {
                ZStack {
                    Image("AccountTab")
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                }
            }
            .padding(.bottom, 20)
            Spacer()
            Button(action: {
                selectedTab = 1 // Navigate to AddView when pressed
            }) {
                ZStack {
                    Image("MoreTab")
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                }
            }
            .padding(.bottom, 20)
        }
        .background()
        
        
        
    }
}

struct HomeView: View {
    var body: some View {
        Text("Home")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct AddView: View {
    var body: some View {
        Text("Add")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
