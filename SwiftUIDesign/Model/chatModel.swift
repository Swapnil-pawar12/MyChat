//
//  chatModel.swift
//  SwiftUIDesign
//
//  Created by Mac on 27/06/24.
//
import Firebase
import Firebase
import FirebaseFirestore
import FirebaseAuth
struct ChatMessage:Identifiable{
    var id:String{documentId}
    let documentId:String
    let fromID,toID,chatText:String
    init(documentId:String,data:[String:Any]){
        self.documentId = documentId
        self.fromID = data["fromID"] as! String
        self.toID = data["toID"] as! String
        self.chatText = data["text"] as! String
    }
}

class chatModel: ObservableObject {
    let chatUser: UserViewModel?
    @Published var chatText: String = ""
    @Published var chatMessageArray: [ChatMessage] = []

    init(chatUser: UserViewModel?) {
        self.chatUser = chatUser
        self.getMessages()
    }

    private func getMessages() {
        guard let fromId = FirebaseManeger.shared.auth.currentUser?.uid else { return }
        guard let toId = chatUser?.uid else { return }
        FirebaseManeger.shared.firebaseStorage.collection("Messages")
            .document(fromId)
            .collection(toId)
            .order(by: "time")
            .addSnapshotListener { querySnapshot, err in
                if let err = err {
                    print("Cannot fetch messages", err)
                    return
                }
                querySnapshot?.documentChanges.forEach({ changes in
                    if changes.type == .added {
                        let data = changes.document.data()
                        let docId = changes.document.documentID
                        self.chatMessageArray.append(.init(documentId: docId, data: data))
                    }
                })
                print("all measseges",self.chatMessageArray)
            }
    }

    func handleSend(chatText: String) {
        print("Text----", chatText)
        self.chatText = chatText
        guard let fromID = FirebaseManeger.shared.auth.currentUser?.uid else { return }
        guard let toID = chatUser?.uid else { return }
        
        let document = FirebaseManeger.shared.firebaseStorage.collection("Messages")
            .document(fromID)
            .collection(toID)
            .document()
        let messageData = ["fromID": fromID, "toID": toID, "text": chatText, "time": Timestamp()] as [String : Any]
        document.setData(messageData) { err in
            if let err = err {
                print("Message is not saved", err)
            }
            print("Data saved")
            self.persistRecentMessage()
        }
        let receiptMessageDocument = FirebaseManeger.shared.firebaseStorage.collection("Messages")
            .document(toID)
            .collection(fromID)
            .document()
        receiptMessageDocument.setData(messageData) { err in
            if let err = err {
                print("Message is not saved", err)
            }
            print("Data saved")
        }
    }
    private func persistRecentMessage() {
        guard let uid = FirebaseManeger.shared.auth.currentUser?.uid else { return }
        guard let toId = chatUser?.uid else { return }
        guard let toEmail = chatUser?.email else { return }

        let recentMessageData: [String: Any] = [
            "time": Timestamp(),
            "text": self.chatText,
            "fromId": uid,
            "toId": toId,
            "profileImg": chatUser?.profileImg ?? "",
            "name": chatUser?.userName ?? "",
            "toEmail": toEmail
        ]
        
        // Save the message in the sender's recent_messages collection
        let senderRecentMessageDocument = FirebaseManeger.shared.firebaseStorage
            .collection("recent_messages")
            .document(uid)
            .collection("messages")
            .document(toId)
        
        senderRecentMessageDocument.setData(recentMessageData) { error in
            if let err = error {
                print("Failed to save recent message for sender: \(err)")
                return
            }
            print("Recent message saved for sender")
        }

        // Save the message in the receiver's recent_messages collection
        let receiverRecentMessageDocument = FirebaseManeger.shared.firebaseStorage
            .collection("recent_messages")
            .document(toId)
            .collection("messages")
            .document(uid)
        
        receiverRecentMessageDocument.setData(recentMessageData) { error in
            if let err = error {
                print("Failed to save recent message for receiver: \(err)")
                return
            }
            print("Recent message saved for receiver")
        }
    }

    private func sendNotification(toId: String, message: String) {
        let notificationData: [String: Any] = [
            "toId": toId,
            "message": message,
            "time": Timestamp(),
            "fromId": FirebaseManeger.shared.auth.currentUser?.uid ?? ""
        ]
        
        FirebaseManeger.shared.firebaseStorage
            .collection("notifications")
            .document(toId)
            .setData(notificationData) { error in
                if let err = error {
                    print("Notification could not be sent: \(err)")
                    return
                }
                print("Notification sent to \(toId)")
            }
    }

   
}
