//
//  CustomUserCell.swift
//  SwiftUIDesign
//
//  Created by Mac on 24/06/24.
//

import SwiftUI
import SDWebImageSwiftUI
struct CustomUserCell: View {
    var url:String
    var userName:String
    var body: some View {
        VStack{
            HStack{
                let url = URL(string: url)
                WebImage(url: url)
                    .resizable()
                    .frame(width: 50,height: 50)
                    .background(.red)
                    .clipShape(Circle())
                Text(userName)
                    .foregroundColor(.black)
                    .font(.latoBold_16)
                    .lineLimit(1)
            }.frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal,10)
        }.frame(maxWidth: .infinity)
            .frame(height: 60)
            
            .background(.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 10)
    }
}

struct CustomUserCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomUserCell(url: "https://firebasestorage.googleapis.com:443/v0/b/chatapp-2c1ca.appspot.com/o/xajWXrriCuOh5MCLH2Ic69FhB0Z2?alt=media&token=934fcd34-b7be-4535-bbde-bc31be5c6977", userName: "swapnil")
    }
}
