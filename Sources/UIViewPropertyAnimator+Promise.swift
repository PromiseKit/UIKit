#if !PMKCocoaPods
import PromiseKit
#endif
import UIKit

@available(iOS 10, tvOS 10, *)
public extension UIViewPropertyAnimator {
    func startAnimation(_: PMKNamespacer) -> Guarantee<UIViewAnimatingPosition> {
        return Guarantee<UIViewAnimatingPosition>(cancellableTask: self) {
            addCompletion($0)
            startAnimation()
        }
    }
}

@available(iOS 10, tvOS 10, *)
extension UIViewPropertyAnimator: CancellableTask {
    public func cancel() {
        stopAnimation(true)
    }
    
    public var isCancelled: Bool {
        return (state == .inactive) && (fractionComplete < 1.0)
    }
}

//////////////////////////////////////////////////////////// Cancellable wrapper

@available(iOS 10, tvOS 10, *)
extension UIViewPropertyAnimator {
    public func cancellableStartAnimation(_: PMKNamespacer) -> CancellablePromise<UIViewAnimatingPosition> {
        return cancellable(startAnimation(.promise))
    }
}
