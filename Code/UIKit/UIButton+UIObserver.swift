import UIKit
import SwiftObserver

extension UIButton: Observable
{
    public var latestUpdate: UIControlEvents { return [] }
    
    public func add(_ observer: AnyObject,
                    _ receive: @escaping (UpdateType) -> Void)
    {
        ObservationService.add(observer, of: self, receive)
        
        guard !allTargets.contains(self) else { return }
        
        addTarget(self, action: #selector(sendTouchDown), for: .touchDown)
        addTarget(self, action: #selector(sendTouchUpInside), for: .touchUpInside)
        addTarget(self, action: #selector(sendTouchUpOutside), for: .touchUpOutside)
        addTarget(self, action: #selector(sendTouchCancel), for: .touchCancel)
    }
    
    @objc private func sendTouchDown() { send(.touchDown) }
    @objc private func sendTouchUpInside() { send(.touchUpInside) }
    @objc private func sendTouchUpOutside() { send(.touchUpOutside) }
    @objc private func sendTouchCancel() { send(.touchCancel) }
}

extension UIButton: TextPresenter
{
    var presentedText: String?
    {
        get { return currentTitle }
        set { setTitle(newValue, for: .normal) }
    }
}
