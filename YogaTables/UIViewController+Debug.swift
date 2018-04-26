import UIKit

extension UIViewController {
	#if DEBUG
	@objc func injected() {
		for subview in self.view.subviews {
			subview.removeFromSuperview()
		}

		viewDidLoad()
	}
	#endif
}

extension UIView {
	#if DEBUG
	@objc func injected() {
		self.layoutSubviews()
	}
	#endif
}
