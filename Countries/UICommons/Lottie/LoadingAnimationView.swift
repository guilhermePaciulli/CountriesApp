import Lottie
import SwiftUI

struct LoadingAnimationView: View {
    var body: some View {
        LottieSwiftUIView(
            name: "loading_world",
            loopMode: .autoReverse,
            isAnimating: .constant(true)
        )
    }
}

struct LottieSwiftUIView: UIViewRepresentable {
    let name: String
    let loopMode: LottieLoopMode
    @Binding var isAnimating: Bool
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        let animationView = AnimationView()
        animationView.animation = Animation.named(name)
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.play()
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let animationView = uiView.subviews.first(
            where: { $0 is AnimationView }
        ) as? AnimationView else {
            return
        }
        if isAnimating {
            animationView.play()
        } else {
            animationView.stop()
        }
    }
}
