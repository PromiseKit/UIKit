#if !PMKCocoaPods
import PromiseKit
#endif
import UIKit

@available(iOS 10, tvOS 10, *)
public extension UIViewPropertyAnimator {
    /// - Note: cancelling this promise will cancel the underlying task
    /// - SeeAlso: [Cancellation](http://promisekit.org/docs/)
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
