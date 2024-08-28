//
//  File.swift
//  SwiftUIDesign
//
//  Created by Mac on 24/06/24.
//

import Foundation
class FirebaseHelper:ObservableObject{
    @Published var allUsers = [UserViewModel]()
    @Published var chatUser : UserViewModel?
    @Published var isCurrentLogOut:Bool = true
    @Published var isLoggedIn: Bool = false
    @Published var loginError: String?
    @Published var recentMessagesArray = [RecentMessage]()
    init() {
        self.fetchCurrentUser()
        self.fetchAllUsers()
        self.fetchRecentMessage()
    }
    func fetchRecentMessage(){
        guard let uid = FirebaseManeger.shared.auth.currentUser?.uid else{return}
        FirebaseManeger.shared.firebaseStorage.collection("recent_messages")
            .document(uid)
            .collection("messages")
            .addSnapshotListener { snapshot, err in
                if let err = err{
                    print("cant not get recent messages\(err)")
                    return
                }
                print("recent message data get sucessfully ")
                snapshot?.documentChanges.forEach({ changes in
                    if changes.type == .added{
                        let document = changes.document.documentID
                        self.recentMessagesArray.append(.init(documentId: document, data: changes.document.data()))
                    }
                })
            }
    }
    func fetchCurrentUser(){
        guard let uid =  FirebaseManeger.shared.auth.currentUser?.uid else{return}
        FirebaseManeger.shared.firebaseStorage.collection("users")
            .document(uid).getDocument { snapshot, err in
                if let err = err{
                    print("erro",err)
                    return
                }
                guard let data = snapshot?.data() else {return}
                print("data",data)
                let uid = data["uid"] as? String ?? ""
                let email = data["userName"] as? String ?? ""
                let profileImg = data["userProfileImg"] as? String ?? ""
                let userName = data["name"] as? String ?? ""
                self.chatUser = UserViewModel(data: data)
            }
    }
    func userSignOut() {
        do {
            try FirebaseManeger.shared.auth.signOut()
            DispatchQueue.main.async {
                self.isLoggedIn = false
            }
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    func login(email: String, password: String) {
        FirebaseManeger.shared.auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Failed to log in: \(error.localizedDescription)")
                return
            }
            print("login")
            DispatchQueue.main.async {
                self.isLoggedIn = true
            }
        }
    }
    func fetchAllUsers() {
        FirebaseManeger.shared.firebaseStorage.collection("users")
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Failed to get users: \(error)")
                    return
                }
                guard let documents = snapshot?.documents else {
                    print("No documents found")
                    return
                }
                DispatchQueue.main.async {
                    self.allUsers = documents.compactMap { document in
                        let data = document.data()
                        let user = UserViewModel(data: data)
                        return user.uid != FirebaseManeger.shared.auth.currentUser?.uid ? user : nil
                    }
                }
            }
    }
    
}

