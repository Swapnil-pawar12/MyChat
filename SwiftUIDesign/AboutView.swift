import SwiftUI
import SDWebImageSwiftUI

struct AboutView: View {
    @ObservedObject private var user = FirebaseHelper()
    @State private var shouldNavigateToRegister = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ZStack {
                Color.munBackgroundColor
                VStack {
                    CustomNavigationBar(title: "About", profilePictureIsHide: true, rightImgHidden: false, titleIsHidden: false, username: "", url: "", rightBtnTapped: {self.presentationMode.wrappedValue.dismiss()}, threeDotBtnTapped: {})
                    ScrollView(.vertical) {
                        VStack {
                            let url = URL(string: user.chatUser?.profileImg ?? "")
                            WebImage(url: url)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black.opacity(0.5), lineWidth: 3)
                                )
                                .padding(.bottom, 10)
                                .padding(.top, 20)
                            Text(user.chatUser?.userName ?? "")
                                .font(.latoBold_20)
                                .foregroundColor(Color.munPrimaryColor)
                                .padding(.bottom, 40)
                            Button(action: {
                                user.userSignOut()
                                shouldNavigateToRegister = true
                            }) {
                                Text("Sign Out")
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 50)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black.opacity(0.5), lineWidth: 1)
                                    )
                                    .padding(.horizontal, 20)
                            }
                            .background(
                                NavigationLink(destination: RegisterView(), isActive: $shouldNavigateToRegister) {
                                    EmptyView()
                                }
                                .hidden()
                            )
                        }
                    }
                    Spacer()
                }
            }
            .ignoresSafeArea(.all)
        }
        .navigationBarHidden(true)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

