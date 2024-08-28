//
//  MuncipalHomeView.swift
//  SwiftUIDesign
//
//  Created by Mac on 13/06/24.
//

import SwiftUI

struct MuncipalHomeView: View {
    var array:[Card] = [Card(image: "Wallet", hoderName: "peter"),Card(image: "Wallet", hoderName: "peter"),Card(image: "Wallet", hoderName: "peter"),Card(image: "Wallet", hoderName: "peter"),Card(image: "Wallet", hoderName: "peter"),Card(image: "Wallet", hoderName: "peter"),Card(image: "Wallet", hoderName: "peter"),Card(image: "Wallet", hoderName: "peter")]
    var isSlectd = 0
    var body: some View {
        NavigationView{
            ZStack {
                Color.munBackgroundColor
                VStack(alignment: .leading){
//                    CustomNavigationBar(title: "", profilePictureIsHide: false, rightImgHidden: true, titleIsHidden: true, leftBtnIsHidden: false, rightBtnTapped: {} )
                    Spacer()
                    ScrollView(.vertical,showsIndicators: false){
                        VStack{
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack{
                                    ForEach(Array(array.enumerated()),id: \.offset){
                                        index,item in
                                        CustomCarouselView(image: item.image, holderName: item.hoderName)
                                            .frame(width: UIScreen.main.bounds.width)
                                    }
                                }.padding(.top,10)
                                .frame(maxWidth: .infinity)
                            }
                           CarouselView(array: array)
                        }.padding(.bottom,18)
                        HStack(alignment: .center, spacing: 25){
                            Button(action: {}) {
                                cell(image: "FriendsIC", text: "Pay a Friend")
                            }
                            Button(action: {}) {
                                cell(image: "ic_account", text: "My Accounts")
                            }
                            Button(action: {}) {
                                cell(image: "ic_transfer", text: "Bank Transfer")
                            }
                        }.padding(.bottom, 22)
                        VStack(alignment: .leading){
                            Text("Documents")
                                .font(.latoSemibold_16)
                                .foregroundColor(Color.munPrimaryColor)
                                .padding(.leading, 20)
                                .padding(.bottom, 10)
                            Button(action: {}) {
                                        HStack {
                                            Image("pendingDoc")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .padding(.leading, 15)
                                            Text("Pending Documents")
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 48)
                                    }
                                    .background(Color.white)
                                    .roundedCorner(10, corners: [.topLeft,.topRight])
                                    .padding(.horizontal, 20)
                                    .padding(.bottom,-10)
                            Button(action: {}) {
                                        HStack {
                                            Image("pendingDoc")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .padding(.leading, 15)
                                            Text("Ordered Documents")
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 48)
                                    }
                                    .background(Color.white)
                                    .roundedCorner(10, corners: [.bottomLeft,.bottomRight])
                                    .padding(.horizontal, 20)
                                    
                            
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.bottom,22)
                        VStack(alignment: .leading){
                            Text("Documents")
                                .font(.latoSemibold_16)
                                .foregroundColor(Color.munPrimaryColor)
                                .padding(.leading, 20)
                                .padding(.bottom, 10)
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack{
                                    ForEach(1..<6){item in
                                        customCard()
                                    }
                                }.padding(.horizontal, 20)
                            }
                        }
                        .frame(maxWidth:.infinity,alignment:.leading)
                    }
                    Spacer()
//                    MucipalTabBarView()
//                        .frame(height: 100)
                }.frame(maxWidth: .infinity,alignment: .leading)
            }
            .ignoresSafeArea(.all)
        }
        .navigationBarHidden(true)
    }
    func onTap(){
        print("Sd")
    }
}

struct MuncipalHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MuncipalHomeView()
    }
}


struct cell:View{
    var image:String
    var text:String
    var body: some View{
        VStack{
            Image(image)
                .resizable()
                .frame(width: 40,height: 40)
            Text(text)
                .font(.latoRegular_12)
                .foregroundColor(.black)
        }
    }
}
struct customCard:View{
    var body: some View{
        VStack{
            HStack{
                Text("Debit")
                    .font(.latoRegular_12)
                    .foregroundColor(.white)
                    .padding(.leading,10)
                    .padding(.bottom)
                Spacer()
                Image("MasterCard")
                    .resizable()
                    .frame(width: 25,height: 25)
                    .padding(.trailing,10)
                
            }.padding(.top,10)
            Spacer()
            VStack(alignment: .leading){
                Text("Balance")
                    .font(.latoSemibold_12)
                    .foregroundColor(.white)
                Text("$435000")
                    .font(.latoMedium_14)
                    .foregroundColor(.white)
            }.frame(maxWidth: .infinity,alignment: .leading)
            .padding(.leading,10)
            .padding(.bottom,10)

        }
        .background(.black)
        .cornerRadius(10)
        .frame(width: 120,height: 120)
    }
}
struct customCard_Previews: PreviewProvider {
    static var previews: some View {
        customCard()
    }
}
struct Card1: Identifiable {
    var id = UUID()
    var title: String
}
import SwiftUI

struct CardView: View {
    var card: Card1

    var body: some View {
        VStack {
            Text(card.title)
                .font(.largeTitle)
                .padding()
            Text("Content goes here")
                .font(.body)
                .padding()
        }
        .frame(width: UIScreen.main.bounds.width - 20, height: 200)
        .background(Color.blue)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}
import SwiftUI


struct ContentView1: View {
    let cards = [
        Card1(title: "Card 1"),
        Card1(title: "Card 2"),
        Card1(title: "Card 3"),
        Card1(title: "Card 4"),
        Card1(title: "Card 5")
    ]
    
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ForEach(cards.indices, id: \.self) { index in
                    CardView(card: cards[index])
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.vertical, 20)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 200) // Adjust height as needed
            HStack(spacing: 10) {
                ForEach(cards.indices, id: \.self) { index in
                    Capsule()
                        .fill(index == selectedTab ? Color.blue : Color.gray)
                        .frame(width: index == selectedTab ? 20 : 10, height: 10)
                        .animation(.easeInOut, value: selectedTab)
                }
            }
            .padding(.top, 10)
        }
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}

