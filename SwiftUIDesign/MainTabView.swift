//
//  MainTabView.swift
//  SwiftUIDesign
//
//  Created by Mac on 24/06/24.
//

import SwiftUI

struct MainTabView:View{
    @ObservedObject private var user = FirebaseHelper()
    @State private var selectedTab = 1
    var body: some View {
        NavigationView{
            ZStack{
//                VStack{
//                    if selectedTab == 1 {
//                        ChatHomeView()
//                    } else if selectedTab == 2 {
//                        AboutView()
//                    }else if selectedTab == 3{
//                        Text("hii")
//                    }
//                    Spacer()
//                    HStack(spacing: 20) {
//                        
//                        Button(action: {
//                            selectedTab = 1
//                        }) {
//                            VStack {
//                                Image("MucipalHome")
//                                    .scaledToFill()
//                                    .frame(width: 20, height: 20)
//                                if selectedTab == 1 {
//                                    Text("Home")
//                                        .font(.latoRegular_14)
//                                        .foregroundColor(Color.munPrimaryColor)
//                                }
//                            }
//                        }.padding(.leading,30)
//                        
//                        Spacer()
//                        Button(action: {
//                            selectedTab = 2
//                        }) {
//                            VStack {
//                                Image("HomeTab")
//                                    .frame(width: 20, height: 20)
//                                if selectedTab == 2 {
//                                    Text("Accounts")
//                                        .font(.latoRegular_14)
//                                        .foregroundColor(Color.munPrimaryColor)
//                                }
//                            }
//                        }.padding(.trailing,30)
//                    }.padding(.top,10)
//                    
//                        .padding(.bottom,20)
//                        .padding(.horizontal, 20)
//                        .background(.white)
//                }
            }.ignoresSafeArea(.all)
        }.navigationBarHidden(true)
    }
}
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
