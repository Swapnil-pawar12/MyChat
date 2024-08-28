//
//  MucipalTabBarView.swift
//  SwiftUIDesign
//
//  Created by Mac on 13/06/24.
//

import SwiftUI

struct MucipalTabBarView: View {
    @State private var selectedTab = 1
    var body: some View {
        ZStack{
        VStack{
            if selectedTab == 1 {
                MuncipalHomeView()
            } else if selectedTab == 2 {
                AccountView()
            } else if selectedTab == 3 {
                HomePageView()
            } else if selectedTab == 4 {
                DetailsView()
            } else if selectedTab == 5 {
                DetailsView()
                
            }
            Spacer()
            HStack(spacing: 20) {
                Button(action: {
                    selectedTab = 1
                }) {
                    VStack {
                        Image("MucipalHome")
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                        if selectedTab == 1 {
                            Text("Home")
                                .font(.latoRegular_14)
                                .foregroundColor(Color.munPrimaryColor)
                        }
                    }
                }
                Spacer()
                Button(action: {
                    selectedTab = 2
                }) {
                    VStack {
                        Image("HomeTab")
                            .frame(width: 20, height: 20)
                        if selectedTab == 2 {
                            Text("Accounts")
                                .font(.latoRegular_14)
                                .foregroundColor(Color.munPrimaryColor)
                        }
                        
                    }
                }
                Spacer()
                Button(action: {
                    selectedTab = 3
                }) {
                    VStack {
                        Image("PaymentTab")
                            .frame(width: 20, height: 20)
                        
                    }
                }
                Spacer()
                Button(action: {
                    selectedTab = 4
                }) {
                    VStack {
                        Image("AccountTab")
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                    }
                }
                Spacer()
                Button(action: {
                    selectedTab = 5 // Navigate to AddView when pressed
                }) {
                    VStack {
                        Image("MoreTab")
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                    }
                }
                
                
            }.padding(.top,10)
                .padding(.bottom,20)
                .padding(.horizontal, 20)
                .background(.white)
        }
        }.ignoresSafeArea(.all)
    }
}

struct MucipalTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MucipalTabBarView()
    }
}
