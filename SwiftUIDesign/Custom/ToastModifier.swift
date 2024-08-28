import SwiftUI

struct ToastView: View {
    var message: String
    var isError = false
    var body: some View {
        Text(message)
            .font(.latoBold_16)
            .padding()
            .background(isError ? Color.red.opacity(0.8) : Color.black.opacity(0.5))
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 10)
            .transition(.opacity)
            .zIndex(1)
    }
}

struct ToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    var message: String
    var duration: TimeInterval = 2.0
    var isError = false
    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                VStack {
                    Spacer()
                    ToastView(message: message,isError: isError)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                                withAnimation {
                                    isPresented = false
                                }
                            }
                        }
                        .transition(.opacity)
                        .padding(.bottom, 50)
                }
            }
        }
    }
}

extension View {
    func toast(isPresented: Binding<Bool>, message: String, duration: TimeInterval = 2.0,isError:Bool) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, duration: duration,isError: isError))
    }
}
