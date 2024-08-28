//
//  AccountView.swift
//  SwiftUIDesign
//
//  Created by Mac on 14/06/24.
//

import SwiftUI
struct cardDeatils{
    let id = UUID()
//    let currentBalance:String
//    let creditLimit:String
//    let blockedAmount:String
//    let openingBalance:String
//    let monthlyTurnover:String
//    let yearlyTurnover:String
    //cardDeatils(currentBalance: "33,60,921 EUR", creditLimit: "0.00", blockedAmount: "921 EUR", openingBalance: "33,60,921 EUR", monthlyTurnover: "0.00 EUR", yearlyTurnover: "0.00 EUR")
    let Title:String
    let subTitle:String
}
struct AccountView: View {
    var cardData:[CardModel] = [CardModel(IBANNo: "248567890011211EUR", descripation: "Трансакциска сметка на Физички Лица", accountBalance: "33,60,921 EUR"),CardModel(IBANNo: "248567890011211EUR", descripation: "Трансакциска сметка на Физички Лица", accountBalance: "33,60,921 EUR"),CardModel(IBANNo: "248567890011211EUR", descripation: "Трансакциска сметка на Физички Лица", accountBalance: "33,60,921 EUR"),CardModel(IBANNo: "248567890011211EUR", descripation: "Трансакциска сметка на Физички Лица", accountBalance: "33,60,921 EUR"),CardModel(IBANNo: "248567890011211EUR", descripation: "Трансакциска сметка на Физички Лица", accountBalance: "33,60,921 EUR"),CardModel(IBANNo: "248567890011211EUR", descripation: "Трансакциска сметка на Физички Лица", accountBalance: "33,60,921 EUR")]
    var perCardData:[cardDeatils] = [cardDeatils(Title: "currentBalance", subTitle: "33,60,921 EUR"),cardDeatils(Title: "creditLimit", subTitle: "0.00"),cardDeatils(Title: "blockedAmount", subTitle: "921 EUR"),cardDeatils(Title: "openingBalance", subTitle: "33,60,921 EUR"),cardDeatils(Title: "monthlyTurnover", subTitle: "33,60,921 EUR"),cardDeatils(Title: "yearlyTurnover", subTitle: "33,60,921 EUR")]
    var sampleArray:[cardDeatils] = []
    @State private var selectedTab = 1
    @State private var selectedIndex = 0
    @State private var showAll = false

    var body: some View {
        NavigationView{
            ZStack{
                Color.munBackgroundColor
                VStack{
                    CustomNavigationBar(title: "Accounts", titleIsHidden: false, username:"", url:"",rightBtnTapped: {}, threeDotBtnTapped: {})
                    HStack{
                        Button(action: {
                             selectedTab = 1
                        }) {
                            VStack{
                                Text("Accounts")
                                    .font(.latoMedium_14)
                                    .foregroundColor(selectedTab == 1 ? Color.munPrimaryColor : Color.black)
                                    .padding(.top,17)
                                Spacer()
                                if selectedTab == 1{
                                    VStack(alignment: .center){
                                    }.frame(width: 54,height: 4)
                                        .roundedCorner(10, corners: [.topLeft,.topRight])
                                        .background(Color.munPrimaryColor)
                                }
                            }
                        }.padding(.leading,60)
                        Spacer()
                        Button(action: {
                            selectedTab = 2
                        }) {
                            VStack{
                                Text("Deposits")
                                    .font(.latoMedium_14)
                                    .foregroundColor(selectedTab == 2 ? Color.munPrimaryColor : Color.black)
                                    .padding(.top,17)
                                Spacer()
                                if selectedTab == 2{
                                    VStack(alignment: .center){
                                    }.frame(width: 54,height: 4)
                                        .roundedCorner(10, corners: [.topLeft,.topRight])
                                        .background(Color.munPrimaryColor)
                                }
                            }
                        }.padding(.trailing,60)
                    }
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    ScrollView(.vertical){
                        VStack{
                            TabView(selection: $selectedIndex) {
                                ForEach(Array(cardData.enumerated()),id: \.offset){ index,item in
                                    CustomCardVIew()
                                        .frame(width: UIScreen.main.bounds.width)
                                        .padding(.vertical, 20)
                                        .tag(index)
                                }
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .frame(height: 156)
                            .padding(.top,10)
                            HStack(spacing: 5) {
                                ForEach(Array(cardData.enumerated()),id: \.offset) { index,item in
                                    Capsule()
                                        .fill(index == selectedIndex ? Color.munPrimaryColor : Color.gray)
                                        .frame(width: index == selectedIndex ? 22 : 9, height: 9)
                                        .animation(.easeInOut, value: selectedIndex)
                                }
                            }
                            .padding(.top, 10)
                        
                            VStack{
                                ForEach(Array(perCardData.prefix(showAll ? perCardData.count : 3).enumerated()), id: \.offset){index,item in
                                   
                                    HStack{
                                        Text(item.Title)
                                            .font(.latoRegular_14)
                                        Spacer()
                                        Text(item.subTitle)
                                            .font(.latoMedium_14)
                                            .foregroundColor(Color.munPrimaryColor)
                                    }.padding(.horizontal,16)
                                        .padding(.top,10)
                                        .padding(.bottom, -10)
                                }
                                HStack{
                                    Button(action: {
                                        showAll.toggle()
                                    }) {
                                        Text(showAll ? "Close details" : "More details")
                                            .font(.latoSemibold_12)
                                            .foregroundColor(Color.munPrimaryColor)
                                        
                                        Image(showAll ? "ic_CloseArrow" : "ic_MoreArrow" )
                                            .resizable()
                                            .frame(width: 12,height: 8)
                                    }
                                    Spacer()
                                }.frame(maxWidth: .infinity,alignment:.leading)
                                    .padding(.leading,16)
                                    .padding(.top,10)
                                    .padding(.bottom,10)
                                    
                            }.frame(maxWidth: .infinity,alignment:.leading)
                                .background(.white)
                                .cornerRadius(10)
                                .padding(.horizontal,20)
                                .padding(.bottom,22)
                                .padding(.top,10)
                            HStack{
                                Image("ic_Transaction")
                                    .resizable()
                                    .frame(width: 24,height: 24)
                                    .padding(.leading,19)
                                Text("Transaction history")
                                    .font(.latoRegular_14)
                                    .padding(.leading,13)
                                Spacer()
                                Image("ic_More")
                                    .resizable()
                                    .frame(width: 24,height: 24)
                                    .padding(.trailing,16)

                            }
                            .frame(maxWidth: .infinity,alignment:.leading)
                            .frame(height: 70)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black,lineWidth:1)
                                       
                                )
                            .padding(.horizontal,20)
                        }
                    }
                    Spacer()
                }
            }.ignoresSafeArea(.all)
        }.navigationBarHidden(true)
    }
}
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
import SwiftUI

struct ContentView2: View {
    @State private var height: CGFloat = 100.0

    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(height: height)
                .animation(.easeInOut, value: height)
            
            HStack {
                Button(action: {
                    height += 20
                }) {
                    Text("Increase Height")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    height -= 20
                }) {
                    Text("Decrease Height")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .padding()
    }
}
struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

