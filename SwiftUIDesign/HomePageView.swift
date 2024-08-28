//
//  HomePageView.swift
//  SwiftUIDesign
//
//  Created by Mac on 11/06/24.
//

import SwiftUI
struct ColletionViewData{
    let id = UUID()
    let mainColor:Color
    let image:String
    let title:String
}
struct HomePageView: View {
    let array:[ColletionViewData] = [ColletionViewData(mainColor: .grayColor, image: "Cards", title: "Cryptocurrency Landing Page"),ColletionViewData(mainColor: .ceruleanBlue, image: "Cards", title: "Cryptocurrency Landing Page"),ColletionViewData(mainColor: .oranage, image: "Cards", title: "Cryptocurrency Landing Page"),ColletionViewData(mainColor: .puertoRico, image: "Cards", title: "Cryptocurrency Landing Page"),ColletionViewData(mainColor: .grayColor, image: "Cards", title: "Cryptocurrency Landing Page"),ColletionViewData(mainColor: .grayColor, image: "Cards", title: "Cryptocurrency Landing Page")]
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                ScrollView(.vertical,showsIndicators: false){
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Hi samantha")
                                    .fontWeight(.heavy)
                                    .font(.system(size: 30))
                                    .padding(.leading, 20)
                                Text("Here are your projctes")
                                    .padding(.leading, 20)
                            }
                            Spacer()
                            Circle()
                                .fill(Color.grayColor)
                                .frame(width: 200,height: 200)
                                .padding(.trailing,-90)
                        }
                        .frame(alignment: .leading)
                        .padding(.bottom, 20)
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(Array(array.enumerated()),id: \.offset){
                                    index,item in
                                    NavigationLink(destination: DetailsView()) {
                                        CustomColletionView(mainColor: item.mainColor, image: item.image, title: item.title)
                                            .padding(.trailing, 10)
                                    }
                                    
                                }
                            }.padding(.horizontal, 20)
                                .padding(.bottom,30)
                        }
                        VStack(alignment: .leading){
                            Text("Personal Task")
                                .fontWeight(.heavy)
                                .font(.system(size: 20))
                                .padding(.leading,20)
                                .padding(.top,20)
                                ForEach(1..<6) { i in
                                    CustomeTableView()
                                        .padding(.leading, 20)
                                        .padding(.trailing, 20)
                                }
                        }
                        .padding(.bottom,20)
                        .background(Color.grayColor)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        
                    }
                
                }
                    Spacer()
                  CustomTabBar()
                        .padding(.bottom, -30)
            }
            }
        }
    }
   
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
