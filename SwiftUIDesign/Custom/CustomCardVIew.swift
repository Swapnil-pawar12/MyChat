//
//  CustomCardVIew.swift
//  SwiftUIDesign
//
//  Created by Mac on 14/06/24.
//

import SwiftUI

struct CustomCardVIew: View {
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("IBAN")
                        .font(.latoSemibold_12)
                    Text("248567890011211EUR")
                        .font(.latoRegular_16)
                        .foregroundColor(Color.munPrimaryColor)
                    Text("Трансакциска сметка на Физички Лица")
                        .font(.latoSemibold_12)
                }.padding(.top,10)
                Spacer()
                HStack{
                    Image("ic_Copy")
                        .resizable()
                        .frame(width: 24,height: 24)
                    Image("ic_Share")
                        .resizable()
                        .frame(width: 24,height: 24)
                }
            }.frame(maxWidth: .infinity,alignment:.leading)
                .padding(.horizontal,16)
            Spacer()
            HStack{
                VStack(alignment: .leading){
                    Text("Account balance")
                        .font(.latoSemibold_12)
                        .foregroundColor(Color.black)
                    Text("33,60,921 EUR")
                        .font(.latoBold_20)
                        .foregroundColor(Color.munPrimaryColor)
                }
                Spacer()
                HStack{
                    Image("ic_Send")
                        .resizable()
                        .frame(width: 24,height: 16)
                    Text("Pay")
                        .font(.latoSemibold_14)
                        .foregroundColor(Color.white)
                }.frame(width: 80,height: 36)
                    .background(Color.munPrimaryColor)
                    .cornerRadius(10)
            }.frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.bottom, 16)
        }.frame(height: 156)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(10)
            .padding(.horizontal,20)
    }
}

struct CustomCardVIew_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardVIew()
    }
}
