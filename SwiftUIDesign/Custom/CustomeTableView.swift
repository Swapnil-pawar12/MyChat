//
//  CustomeTableView.swift
//  SwiftUIDesign
//
//  Created by Mac on 11/06/24.
//

import SwiftUI

struct CustomeTableView: View {
    var body: some View {
        VStack{
        HStack{
            Image("AddBtn")
                .resizable()
                .frame(width: 50,height: 50)
                .padding(.leading, 10)
            VStack(alignment: .leading,spacing: 5){
                Text("NDA Review for website projects")
                Text("Total - 10pm")
            }
            Spacer()
            Circle()
                .fill()
                .frame(width: 10,height: 10)
                .padding(.trailing, 10)
                .padding(.bottom,60)
        }
    }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(.white)
        .cornerRadius(10)
        
    }
}

struct CustomeTableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomeTableView()
    }
}
