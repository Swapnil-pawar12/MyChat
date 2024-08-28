//
//  ChatHomeView.swift
//  SwiftUIDesign
//
//  Created by Mac on 24/06/24.
//

import SwiftUI
import Firebase
struct ChatHomeView: View {
    @ObservedObject private var user = FirebaseHelper()
    @State var showUserSheet:Bool = false
    @State private var showMenu: Bool = false

    var body: some View {
        NavigationView{
            ZStack{
                Color.munBackgroundColor
                VStack{
                    CustomNavigationBar(title: "", profilePictureIsHide: false, titleIsHidden: true,username: user.chatUser?.userName ?? "",url:user.chatUser?.profileImg ?? "", rightBtnTapped: {}, threeDotBtnTapped: {showMenu.toggle()}).background(
                        NavigationLink(destination: AboutView(), isActive: $showMenu) {
                            EmptyView()
                        }
                            .hidden()
                    )
                    ForEach(Array(user.recentMessagesArray.enumerated()),id:\.offset){
                        index,item in
                        let data = ["uid":item.toId ,"name":item.userName,"userName":item.id] as! [String:Any]
                        let mainData = UserViewModel(data: data)
                        NavigationLink(destination: ChatView( chatUser: mainData)) {
                            CustomUserCell(url: item.profileImg, userName: item.userName)
                                .padding(.horizontal,20)
                                .padding(.top,10)
                                .padding(.bottom,-10)
                        }
                        
                    }
                    Spacer()
                }.overlay(alignment: .bottomTrailing){
                    NavigationLink(destination: AllUserShowView()) {
                        VStack{
                            Image("Ic_Chat")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25,height: 25)
                        }
                        .frame(width: 70,height: 80)
                        .background(Color.munPrimaryColor)
                        .clipShape(Circle())
                        .padding(.bottom,20)
                        .padding(.trailing,20)
                    }
                }
                
            }.ignoresSafeArea(.all)
        }.navigationBarHidden(true)
    }
    
}

struct ChatHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHomeView()
    }
}
