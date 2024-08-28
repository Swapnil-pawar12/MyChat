//
//  GlobalConstance.swift
//  SwiftUIDesign
//
//  Created by Mac on 11/06/24.
//

import Foundation
import SwiftUI
extension Color{
    static let primaryColor = Color("primaryColor")
    static let grayColor = Color("GrayColor")
    static let ceruleanBlue = Color("CeruleanBlue")
    static let oranage = Color("Oranage")
    static let puertoRico = Color("PuertoRico")
    static let fentPink = Color("FentPink")
    static let fentOrange = Color("fentOrange")
    static let fentBlue = Color("fentBlue")
    static let munPrimaryColor = Color("MunPrimaryColor")
    static let munBackgroundColor = Color("MunBackgroundColor")
    
}
extension Font{
    // size 10
    static let latoBold_10 = Font(UIFont(name: "Lato-Bold", size: 10)!)
    static let latoMedium_10 = Font(UIFont(name: "Lato-Medium", size: 10)!)
    static let latoRegular_10 = Font(UIFont(name: "Lato-Regular", size: 10)!)
    static let latoSemibold_10 = Font(UIFont(name: "Lato-Semibold", size: 10)!)
    // size 12
    static let latoBold_12 = Font(UIFont(name: "Lato-Bold", size: 12)!)
    static let latoMedium_12 = Font(UIFont(name: "Lato-Medium", size: 12)!)
    static let latoRegular_12 = Font(UIFont(name: "Lato-Regular", size: 12)!)
    static let latoSemibold_12 = Font(UIFont(name: "Lato-Semibold", size: 12)!)
    //size 14
    static let latoBold_14 = Font(UIFont(name: "Lato-Bold", size: 14)!)
    static let latoMedium_14 = Font(UIFont(name: "Lato-Medium", size: 14)!)
    static let latoRegular_14 = Font(UIFont(name: "Lato-Regular", size: 14)!)
    static let latoSemibold_14 = Font(UIFont(name: "Lato-Semibold", size: 14)!)
    //static 16
    static let latoBold_16 = Font(UIFont(name: "Lato-Bold", size: 16)!)
    static let latoBold_20 = Font(UIFont(name: "Lato-Bold", size: 20)!)
    static let latoMedium_16 = Font(UIFont(name: "Lato-Medium", size: 16)!)
    static let latoRegular_16 = Font(UIFont(name: "Lato-Regular", size: 16)!)
    static let latoSemibold_16 = Font(UIFont(name: "Lato-Semibold", size: 16)!)
}
extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
