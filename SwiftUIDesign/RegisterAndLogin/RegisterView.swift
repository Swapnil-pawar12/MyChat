import SwiftUI
import Firebase
import PhotosUI
struct RegisterView: View {
    @State private var isLogin = false
    @State private var name: String = ""
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var selectedImg: UIImage? = nil
    @State private var photoPickerItem: PhotosPickerItem? = nil
    @State private var showToast: Bool = false
    @State private var toastMessage: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.munBackgroundColor
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView(.vertical){
                        PhotosPicker(selection: $photoPickerItem, matching: .images) {
                            Image(uiImage: selectedImg ?? UIImage(named: "ic_account")!)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black.opacity(0.2), lineWidth: 1))
                                .shadow(radius: 1)
                                .padding(.bottom,10)
                                .padding(.top,100)
                        }
                        .onChange(of: photoPickerItem) { newItem in
                            Task {
                                if let newItem {
                                    do {
                                        if let data = try await newItem.loadTransferable(type: Data.self),
                                           let image = UIImage(data: data) {
                                            selectedImg = image
                                        }
                                    } catch {
                                        print("Error loading image: \(error.localizedDescription)")
                                    }
                                }
                            }
                        }
                        Text("Select Image")
                            .font(.latoBold_14)
                            .padding(.bottom,20)
                        VStack(alignment: .leading){
                            Text("Name")
                                .font(.latoBold_12)
                            NormalTextField(placeHolder: "Enter your name", binding: $name)
                                .padding(.bottom,10)
                            Text("Email")
                                .font(.latoBold_12)
                            NormalTextField(placeHolder: "Enter your email", binding: $userName)
                                .padding(.bottom,10)
                            Text("Password")
                                .font(.latoBold_12)
                            SecureTextFieldView(placeHolder: "Enter your password", binding: $password)
                                .padding(.bottom, 20)
                        }.frame(maxWidth: .infinity)
                        Button(action: {
                            checkValidation()
                        }) {
                            VStack(alignment: .leading) {
                                Text("SignIn")
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.munPrimaryColor)
                            .cornerRadius(10)
                        }
                        HStack(spacing:1 ){
                            Text("You have already an account?")
                                .font(.latoMedium_14)
                            NavigationLink(destination: LoginVIew()) {
                                Text("Login")
                                    .font(.latoBold_16)
                                    .foregroundColor(Color.munPrimaryColor)
                            }
                        }.padding(.top,50)
                    }
                }
                .padding(.horizontal, 20)
                .toast(isPresented: $showToast, message: toastMessage,isError: true)
            }
        }.navigationBarHidden(true)
    }
    private func checkValidation(){
        if selectedImg == nil{
            toastMessage = "Please select Img"
            showToast = true
        }else if name == ""{
            toastMessage = "Please enter name"
            showToast = true
        }else if userName == ""{
            toastMessage = "Please enter email"
            showToast = true
        }else if password == ""{
            toastMessage = "Please enter password"
            showToast = true
        }else{
             createAccount()
        }
    }
    private func createAccount() {
        FirebaseManeger.shared.auth.createUser(withEmail: userName, password: password) { result, error in
            if let error = error {
                toastMessage = "\(error.localizedDescription)"
                showToast = true
                isLogin = false
                return
            }
            
            toastMessage = "User saved successfully"
            showToast = true
            storeImg()
            isLogin.toggle()
        }
    }
    private func storeImg() {
        guard let uid = FirebaseManeger.shared.auth.currentUser?.uid else {
            print("User ID not available")
            return
        }
        
        let reference = FirebaseManeger.shared.storage.reference().child(uid) // Use
        guard let imageData = self.selectedImg?.jpegData(compressionQuality: 0.5) else {
            print("Failed to convert image to data")
            return
        }
        
        reference.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                return
            }
            
            // Image uploaded successfully, now get the download URL
            reference.downloadURL { url, error in
                if let error = error {
                    print("Error fetching download URL: \(error.localizedDescription)")
                    return
                }
                
                if let downloadURL = url {
                    print("Download URL: \(downloadURL.absoluteString)")
                    // Here you can use the downloadURL for further operations
                    
                } else {
                    print("Download URL not found")
                }
                guard let url = url else{return}
                self.storeUserInformation(img: url)
            }
        }
    }
    private func storeUserInformation(img:URL){
        guard let uid = FirebaseManeger.shared.auth.currentUser?.uid else{return}
        let userData = ["userName":self.userName,"uid":uid,"userProfileImg":img.absoluteString,"name":self.name]
        FirebaseManeger.shared.firebaseStorage.collection("users")
            .document(uid).setData(userData){err in
                if let err = err{
                    print("user data not save")
                    return
                }
                print("user data  save")
            }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

struct SecureTextFieldView: View {
    var placeHolder: String
    @Binding var binding: String
    @State private var passwordIsHidden: Bool = true
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        HStack {
            if passwordIsHidden {
                SecureField(placeHolder, text: $binding)
                    .font(.latoRegular_16)
                    .offset(x: 10)
                    .keyboardType(keyboardType)
                    .submitLabel(.done)
            } else {
                TextField(placeHolder, text: $binding)
                    .font(.latoRegular_16)
                    .offset(x: 10)
                    .keyboardType(keyboardType)
                    .submitLabel(.done)
            }
            
            Button(action: { passwordIsHidden.toggle() }) {
                Image(passwordIsHidden ? "HidePassword" : "ShowPassword")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 24)
                    .offset(x: -10)
            }
        }
        .frame(height: 56)
        .background(Color.clear)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
        )
    }
}

struct NormalTextField: View {
    var placeHolder: String
    @Binding var binding: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        HStack {
            TextField(placeHolder, text: $binding)
                .font(.latoRegular_16)
                .offset(x: 10)
                .keyboardType(keyboardType)
                .submitLabel(.done)
        }
        .frame(height: 56)
        .background(Color.clear)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
        )
    }
}
