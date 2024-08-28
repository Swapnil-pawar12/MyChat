//
//  SwiftUIDesignApp.swift
//  SwiftUIDesign
//
//  Created by Mac on 11/06/24.
//

import SwiftUI
import Firebase
@main
struct SwiftUIDesignApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        let auth = Auth.auth().currentUser
        WindowGroup {
            if auth != nil{
                ChatHomeView()
            }else{
                LoginVIew()
            }
        }
    }
}
