//
//  LoginVIew.swift
//  SwiftUIDesign
//
//  Created by Mac on 25/06/24.
//

import SwiftUI
import Firebase
struct LoginVIew: View {
    @State var userName:String = ""
    @State var password:String = ""
    @ObservedObject private var user = FirebaseHelper()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.munBackgroundColor
                VStack(alignment: .center){
                    Spacer()
                    ScrollView(.vertical){
                        Image("Icon")
                            .resizable()
                            .frame(width: 100,height: 100)
                            .padding(.bottom,50)
                            .padding(.top,100)
                        VStack(alignment: .leading){
                            Text("Email")
                                .font(.latoBold_12)
                            NormalTextField(placeHolder: "Enter your email", binding: $userName)
                                .padding(.bottom,10)
                            Text("Password")
                                .font(.latoBold_12)
                            SecureTextFieldView(placeHolder: "Enter your password", binding: $password)
                                .padding(.bottom, 20)
                        }.frame(maxWidth: .infinity,alignment:.leading)
                        Button(action: {
                            checkValidation()
                        }) {
                            VStack(alignment: .leading) {
                                Text("Sign In")
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.munPrimaryColor)
                            .cornerRadius(10)
                        }.padding(.bottom,51)
                        HStack(spacing:1 ){
                            Text("Don’t have an account?")
                                .font(.latoMedium_14)
                            NavigationLink(destination: RegisterView()) {
                                Text("Sign up ")
                                    .font(.latoBold_16)
                                    .foregroundColor(Color.munPrimaryColor)
                            }
                        }
                    }.padding(.horizontal, 20 )
                        .background(
                            NavigationLink(destination: ChatHomeView(), isActive: $user.isLoggedIn) {
                                EmptyView()
                            }
                                .hidden()
                        )
                    Spacer()
                    Text("By continuing, you agree to our Terms of Service and Privacy Policy.")
                        .font(.latoBold_14)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,20)
                        .padding(.bottom,30)
                        .frame(maxWidth: .infinity)
                }
                if user.isLoaderOn == true{
                    GeometryReader{_ in
                        Loader()
                    }.background(Color.black.opacity(0.45))
                }
                    
            }.ignoresSafeArea(.all)
                .frame(maxWidth: .infinity,alignment:.leading)
            
        }.navigationBarHidden(true)
        
    }
    func checkValidation(){
        if userName != "" && password != ""{
            user.login(email: userName, password: password)
        }else{
            print("empty")
        }
    }
}

struct LoginVIew_Previews: PreviewProvider {
    static var previews: some View {
        LoginVIew()
    }
}
