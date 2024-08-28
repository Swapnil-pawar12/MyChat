//
//  CustomCarouselView.swift
//  SwiftUIDesign
//
//  Created by Mac on 13/06/24.
//

import SwiftUI
struct Card{
    let id = UUID()
    let image:String
    let hoderName:String
    
}
struct CustomCarouselView: View {
    var image:String
    var holderName:String
    var body: some View {
        VStack{
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 24,height: 24)
                VStack(alignment: .leading,spacing: 5){
                    Text(holderName )
                        .font(.latoSemibold_14)
                    Text("240017001813254EUR")
                        .font(.latoRegular_12)
                }
                Spacer()
                Text("Savings Account")
                    .font(.latoSemibold_14)
                    .foregroundColor(Color.munPrimaryColor)
                    .padding(.bottom)
                    .padding(.trailing,16)
            }.padding(.leading,15)
            HStack{
                Text("0.21 EUR")
                    .font(.latoBold_14)
                    .foregroundColor(Color.munPrimaryColor)
                    
                Spacer()
            }.padding(.leading ,48)
        }.padding(.top,11)
         .padding(.bottom,16)
        .background(.white)
        .cornerRadius(10)
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct CustomCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCarouselView(image: "Wallet", holderName: "peter")
    }
}
struct CarouselView:View{
//    var isSelected:Int
    var array:[Card] = []
    var body: some View{
        HStack{
            ForEach(Array(array.enumerated()),id: \.offset){ index,item in
                Capsule()
                    .frame(width: 22,height: 9)
                    .foregroundColor(Color.munPrimaryColor)
            }
        }
    }
}
//struct CarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarouselView()
//    }
//}
