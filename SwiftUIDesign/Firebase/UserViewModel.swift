//
//  UserViewModel.swift
//  SwiftUIDesign
//
//  Created by Mac on 21/06/24.
//

import Foundation
import Firebase
struct UserViewModel :Identifiable{
    var id:String{uid}
    var userName:String
    var uid: String
    var email: String
    var profileImg: String
    init(data:[String:Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.userName = data["name"] as? String ?? ""
        self.email = data["userName"] as? String ?? ""
        self.profileImg = data["userProfileImg"] as? String ?? ""
    }
}
struct RecentMessage:Identifiable{
    var id:String{documentId}
    var userName:String
    var documentId:String
    var toId:String
    var fromId:String
    var profileImg:String
    var text:String
    var time:Timestamp
    
    init(documentId: String, data:[String:Any]) {
        self.documentId = documentId
        self.toId = data["toId"] as! String
        self.fromId = data["fromId"] as! String
        self.profileImg = data["profileImg"] as! String
        self.text =  data["text"] as! String
        self.userName = data["name"] as! String
        self.time = data["time"] as! Timestamp 
    }
}
