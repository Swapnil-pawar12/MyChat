//
//  FirebaseManeger.swift
//  SwiftUIDesign
//
//  Created by Mac on 24/06/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
class FirebaseManeger:NSObject{
    let auth:Auth
    let storage:Storage
    let firebaseStorage:Firestore
    static let shared = FirebaseManeger()
    
    override init() {
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firebaseStorage = Firestore.firestore()
        super.init()
    }
}
