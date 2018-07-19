import PromiseKit
import PMKCancel
import PMKUIKit
import XCTest
import UIKit

@available(iOS 10, tvOS 10, *)
class UIViewPropertyAnimatorTests: XCTestCase {
    func test() {
        let ex1 = expectation(description: "")
        let ex2 = expectation(description: "")

        let animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn, animations: { [weak self] in
            ex1.fulfill()
        })
        animator.startAnimation(.promise).done { _ in
            ex2.fulfill()
        }

        waitForExpectations(timeout: 1)
    }
}

//////////////////////////////////////////////////////////// Cancellation

@available(iOS 10, tvOS 10, *)
extension UIViewPropertyAnimatorTests {
    func testCancel() {
        let ex1 = expectation(description: "")
        let ex2 = expectation(description: "")
        
        let animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn, animations: { [weak self] in
            ex1.fulfill()
        })
        let p = animator.startAnimationCC(.promise).done { _ in
            XCTFail()
        }.catch(policy: .allErrors) { error in
            error.isCancelled ? ex2.fulfill() : XCTFail("Error: \(error)")
        }
        p.cancel()
        
        XCTAssert(animator.isCancelled)
        XCTAssert(p.isCancelled)

        waitForExpectations(timeout: 1)
    }
}
