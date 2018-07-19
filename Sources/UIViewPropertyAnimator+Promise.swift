#if !PMKCocoaPods
import PMKCancel
import PromiseKit
#endif
import UIKit

@available(iOS 10, tvOS 10, *)
public extension UIViewPropertyAnimator {
    func startAnimation(_: PMKNamespacer) -> Guarantee<UIViewAnimatingPosition> {
        return Guarantee {
            addCompletion($0)
            startAnimation()
        }
    }
}

//////////////////////////////////////////////////////////// Cancellation

@available(iOS 10, tvOS 10, *)
extension UIViewPropertyAnimator: CancellableTask {
    public func cancel() {
        stopAnimation(true)
    }
    
    public var isCancelled: Bool {
        return (state == .inactive) && (fractionComplete < 1.0)
    }
    
    public func startAnimationCC(_: PMKNamespacer) -> CancellablePromise<UIViewAnimatingPosition> {
        return CancellablePromise(task: self) {
            addCompletion($0.fulfill)
            startAnimation()
        }
    }
}
