//
//  AlertVIew.swift
//  SwiftUIDesign
//
//  Created by Mac on 20/08/24.
//

import SwiftUI

struct Loader:View{
    @State var animate = false
    var body: some View{
        VStack{
            Spacer()
            VStack{
                Circle()
                    .trim(from: 0,to: 0.8)
                    .stroke(AngularGradient(gradient: .init(colors: [.munPrimaryColor,.munPrimaryColor.opacity(0.3)]), center: .center),style: StrokeStyle(lineWidth: 8,lineCap: .round))
                    .frame(width: 50,height: 50)
                    .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                    .animation(Animation.linear(duration: 0.4).repeatForever(autoreverses: false))
                Text("Please Wait...")
                    .font(.latoBold_20)
                    .padding(.top,15)
            }.frame(width: 150,height: 150,alignment: .center)
                .background(Color.munBackgroundColor)
                .cornerRadius(10)
            Spacer()
        }        .onAppear{
            self.animate.toggle()
        }
        .frame(maxWidth: .infinity,alignment: .center)
        
    }
}

struct AlertVIew_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
