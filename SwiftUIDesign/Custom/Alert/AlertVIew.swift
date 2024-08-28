//
//  AlertVIew.swift
//  SwiftUIDesign
//
//  Created by Mac on 20/08/24.
//

import SwiftUI

struct AlertVIew: View {
    @State private var isAnimating = false
    var body: some View {
        VStack{
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(lineWidth: 10)
                .foregroundColor(.munPrimaryColor)
                .frame(width: 50, height: 50)
                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear {
                    isAnimating = true
                }
                .padding()
            Text("Loding...")
                .font(.latoBold_20)
            
        }
        .frame(width: 150, height: 150)
        .background(.red)
        .cornerRadius(10)
    }
}


struct AlertVIew_Previews: PreviewProvider {
    static var previews: some View {
        AlertVIew()
    }
}
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var animationName: String
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView(name: animationName)
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleToFill
        animationView.play()
        
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Nothing to update
    }
}
