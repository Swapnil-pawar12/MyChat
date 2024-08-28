//
//  CustomColletionView.swift
//  SwiftUIDesign
//
//  Created by Mac on 11/06/24.
//

import SwiftUI

struct CustomColletionView: View {
    var mainColor:Color
    var image:String
    var title:String
    var body: some View {
        VStack(spacing: 20){
            Image(image)
                .resizable()
                .frame(width: .infinity ,height: 100)
                .padding(.leading, 30)
                .padding(.trailing, 50)
                .cornerRadius(10)
            Text(title)
                .fontWeight(.bold)
                .font(.system(size: 16))
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal,20)
                .foregroundColor(.black)
        }
        .frame(width: 150,height: 250)
        .background(mainColor)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct CustomColletionView_Previews: PreviewProvider {
    static var previews: some View {
        CustomColletionView(mainColor: .grayColor, image: "Cards", title: "dsf")
    }
}
