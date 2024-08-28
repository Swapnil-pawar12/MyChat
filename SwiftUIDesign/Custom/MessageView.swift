//
//  MessageView.swift
//  SwiftUIDesign
//
//  Created by Mac on 27/06/24.
//

import SwiftUI

struct SenderMessageView: View {
    var chatText:String
    var body: some View {
        HStack{
            Spacer()
            HStack{
                Text(chatText)
                    .font(.latoRegular_16)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.munPrimaryColor)
            .cornerRadius(5)
            .padding(.trailing,5)
            
        }
        
        
    }
}

struct ReciverMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ReciverMessageView(chatText: "swapnil lkjglsdjfgjsldfjglsdjfgl")
    }
}

struct ReciverMessageView: View {
    var chatText:String
    var body: some View {
        HStack{
            HStack{
                Text(chatText)
                    .font(.latoRegular_16)
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(5)
            .padding(.leading,5)
            Spacer()
        }
        
        
    }
}
