//
//  AllUserShowView.swift
//  SwiftUIDesign
//
//  Created by Mac on 25/06/24.
//

import SwiftUI

struct AllUserShowView: View {
    @ObservedObject private var user = FirebaseHelper()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView{
        ZStack{
            Color.munBackgroundColor
            VStack{
                CustomNavigationBar(title: "All Users", profilePictureIsHide: true, rightImgHidden: false, titleIsHidden: false, username: "", url: "", rightBtnTapped: {self.presentationMode.wrappedValue.dismiss()}, threeDotBtnTapped: {})
                ScrollView(.vertical){
                    ForEach(Array(user.allUsers.enumerated()),id: \.offset){
                        index , item in
                        NavigationLink(destination: ChatView( chatUser: item)) {
                            CustomUserCell(url: item.profileImg, userName: item.userName)
                                .padding(.horizontal,20)
                                .padding(.top,10)
                                .padding(.bottom,-10)
                        }
                    }
                }
                Spacer()
            }
            if user.allUserLoaderOn{
                GeometryReader{_ in
                    Loader()
                }.background(Color.black.opacity(0.45))
            }
        }.ignoresSafeArea(.all)
        }.navigationBarHidden(true)
    }
}

struct AllUserShowView_Previews: PreviewProvider {
    static var previews: some View {
        AllUserShowView()
    }
}

