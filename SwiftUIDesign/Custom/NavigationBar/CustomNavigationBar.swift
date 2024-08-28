//
//  CustomNavigationBar.swift
//  SwiftUIDesign
//
//  Created by Mac on 24/06/24.
//

import SwiftUI
import SDWebImageSwiftUI
struct CustomNavigationBar: View {
    var title:String
    var profilePictureIsHide: Bool = true
    var rightImgHidden: Bool = true
    var titleIsHidden: Bool = true
    var leftBtnIsHidden:Bool = true
    var username:String
    var url:String
    var rightBtnTapped: () -> Void
    var threeDotBtnTapped: () -> Void

    var body: some View {
        HStack {
            // when title is hidden, show profile picture and holder name
            if !profilePictureIsHide {
                HStack {
                    let url = URL(string: url)
//                    AsyncImage(url: url, content: { image in
//                        image.resizable()
//                            .cornerRadius(10)
//                    }, placeholder: {
//                        ProgressView()
//                    })
//                    .frame(width: 40, height: 40)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(.white, lineWidth: 1)
//                    )
                    WebImage(url: url)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white, lineWidth: 1)
                        )
                    Text(username)
                        .font(.latoBold_16)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        threeDotBtnTapped()
                    }) {
                        Image("Page")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
            } else {
                HStack {
                    if !rightImgHidden {
                        Button(action: {
                            rightBtnTapped()
                        }) {
                            Image("Ic_back")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    Spacer()
                    if !titleIsHidden {
                        Text(title)
                            .font(.custom("Lato-Bold", size: 20))
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    if !leftBtnIsHidden{
                        Button(action: {}) {
                            Image("Page")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                }
            }
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .padding(.top, 10)
        .padding(.bottom, -30)
        .frame(height: 115)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.munPrimaryColor) // Use your desired color here
        .roundedCorner(10, corners: [.bottomLeft, .bottomRight])
    }
}
struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar(title: "", profilePictureIsHide: false, rightImgHidden: true, username: "swapnil", url: "https://firebasestorage.googleapis.com:443/v0/b/chatapp-2c1ca.appspot.com/o/xajWXrriCuOh5MCLH2Ic69FhB0Z2?alt=media&token=934fcd34-b7be-4535-bbde-bc31be5c6977", rightBtnTapped: {}, threeDotBtnTapped: {})
    }
}
