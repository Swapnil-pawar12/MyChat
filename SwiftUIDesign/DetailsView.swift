//
//  DetailsView.swift
//  SwiftUIDesign
//
//  Created by Mac on 11/06/24.
//

import SwiftUI
struct Documet{
    let id = UUID()
    var color:Color
    var image:String
    var title:String
    var subTitle:String
}
struct DetailsView: View {
    var array:[Documet] = [Documet(color: .fentPink, image: "Demo", title: "Layout Docs", subTitle: "Layout Docs"),Documet(color: .fentBlue, image: "Demo", title: "Layout Docs", subTitle: "Layout Docs"),Documet(color: .fentOrange, image: "Demo", title: "Layout Docs", subTitle: "Layout Docs"),Documet(color: .fentPink, image: "Demo", title: "Layout Docs", subTitle: "Layout Docs"),Documet(color: .fentBlue, image: "Demo", title: "Layout Docs", subTitle: "Layout Docs"),Documet(color: .fentOrange, image: "Demo", title: "Layout Docs", subTitle: "Layout Docs"),Documet(color: .fentPink, image: "Demo", title: "Layout Docs", subTitle: "Layout Docs"),Documet(color: .fentBlue, image: "Demo", title: "Layout Docs", subTitle: "Layout Docs"),Documet(color: .fentOrange, image: "Demo", title: "Layout Docs", subTitle: "Layout Docs"),Documet(color: .fentPink, image: "Demo", title: "Layout Docs", subTitle: "Layout Docs"),Documet(color: .fentBlue, image: "Demo", title: "Layout Docs", subTitle: "Layout Docs"),Documet(color: .fentOrange, image: "Demo", title: "Layout Docs", subTitle: "Layout Docs")]
    let numbers = Array(0...6)
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.grayColor
                VStack{
                    VStack(alignment: .leading){
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("back")
                                .frame(width: 30, height: 30)
                        }
                        .padding(.top, 50)
                        .padding(.leading, 20)
                        HStack{
                            VStack(alignment: .leading){
                                Text("Cryptocurrency")
                                    .fontWeight(.bold)
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .padding(.leading, 20)
                                Text("Landing Page ")
                                    .fontWeight(.bold)
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .padding(.leading, 20)
                                HStack{
                                    Image("AddBtn")
                                        .resizable()
                                        .frame(width: 50,height: 50)
                                    Text("samantha")
                                        .foregroundColor(.white)
                                        .fontWeight(.medium)
                                        .font(.system(size: 20))
                                    Spacer()
                                }  .padding(.leading, 20)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                    .padding(.leading,20 )
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                            
                            Image("Demo")
                                .frame(width: 100,height: 100)
                                .scaledToFill()
                        } .padding(.bottom, 50)
                    
                        
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .background(Color.puertoRico)
                    .roundedCorner(50, corners: .bottomLeft)
                    .padding(.bottom,20)
                    ScrollView(.vertical,showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(Array(array.enumerated()),id:\.offset){
                                index,item in
                                CustomGridView( color: item.color, image: item.image, title: item.title, subTitle: item.subTitle)
                                    .padding(.top,10)
                            }
                        }.padding(.leading,20)
                            .padding(.trailing,20)
                    }
                    Spacer()
                    VStack{
                        HStack{
                            Button(action: {}) {
                                Text("Discussion")
                                    .fontWeight(.heavy)
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            Button(action: {}) {
                                Text("Files")
                                    .fontWeight(.heavy)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.horizontal,50)
                    }
                    .frame(height: 80)
                    .background(.white)
                    .roundedCorner(10, corners: [.topLeft,.topRight])
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                }.frame(maxWidth: .infinity,alignment: .leading)
                    
            }
            .ignoresSafeArea(.all)
        }
        .navigationBarHidden(true)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
struct CustomGridView:View{
   
    let color:Color
    let image:String
    let title:String
    let subTitle:String
    
    var body: some View{
        VStack{
            VStack{
                Rectangle()
                    .fill(color)
                    .frame(width: 80,height: 80)
                    .overlay(alignment: .center){
                        Image(image)
                            .resizable()
                            .frame(width: 50,height: 50)
                    }
                    .cornerRadius(10)
                Text(title)
                    .font(.system(size: 13))
                    .padding(.bottom,2)
                Text(subTitle)
                    .font(.system(size: 10))
            }
        }.frame(maxWidth: 100)
    }
}
