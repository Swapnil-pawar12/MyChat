//
//  ChatView.swift
//  SwiftUIDesign
//
//  Created by Mac on 26/06/24.
//

import SwiftUI
import Firebase

struct ChatView: View {
    @Environment(\.presentationMode) var presentationMode
    let chatUser:UserViewModel
    @State var message:String = ""
    @ObservedObject  var userModel:chatModel
    init(chatUser:UserViewModel) {
        self.chatUser = chatUser
        self.userModel = .init(chatUser: chatUser)
    }
    var body: some View {
        NavigationView{
            ZStack{
                Color.munBackgroundColor
                VStack{
                    CustomNavigationBar(title: chatUser.userName, profilePictureIsHide: true, rightImgHidden: false, titleIsHidden: false, username: "", url: "", rightBtnTapped: {self.presentationMode.wrappedValue.dismiss()}, threeDotBtnTapped: {})
                    ScrollViewReader { scrollView in
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                ForEach(userModel.chatMessageArray, id: \.id) { item in
                                    if item.fromID == FirebaseManeger.shared.auth.currentUser?.uid {
                                        SenderMessageView(chatText: item.chatText)
                                    } else {
                                        ReciverMessageView(chatText: item.chatText)
                                    }
                                }
                            }
                            .onChange(of: userModel.chatMessageArray.count) { _ in
                                if let lastMessage = userModel.chatMessageArray.last {
                                    scrollView.scrollTo(lastMessage.id, anchor: .bottom)
                                }
                            }
                        }
                        .onAppear {
                            if let lastMessage = userModel.chatMessageArray.last {
                                scrollView.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
                    }
                    Spacer()
                    HStack{
                        HStack{
                            TextField("Enter a message", text: $message)
                                .font(.latoRegular_16)
                                .keyboardType(.default)
                                .padding(.leading,10)
                        }
                        .frame(height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.leading,10)
                        Button(action: {
                            userModel.handleSend(chatText: message)
                        }){
                            VStack{
                                Image("ic_sendMessage")
                                    .resizable()
                                    .frame(width: 25,height: 25)
                            }
                            .frame(width: 50, height: 50)
                            .background(Color.munPrimaryColor)
                            .cornerRadius(10)
                            .padding(.trailing,10)
                            
                        }
                    }.frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color.munBackgroundColor)
                        .padding(.bottom,30)
                }
            }
            .frame(maxWidth: .infinity)
            .ignoresSafeArea(.all)
        }.navigationBarHidden(true)
            .onAppear {
            }
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView( chatUser: UserViewModel(data: ["email":"swapnil"]))
    }
}
