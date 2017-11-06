import PromiseKit
import UIKit

public extension UIViewPropertyAnimator {
    func startAnimation(_: PMKNamespacer) -> Guarantee<UIViewAnimatingPosition> {
        return Guarantee(.pending) {
            addCompletion($0)
            startAnimation()
        }
    }
}
