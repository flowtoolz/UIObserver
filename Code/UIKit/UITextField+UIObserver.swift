import UIKit

extension UITextField: TextPresenter
{
    public var presentedText: String?
    {
        get { return text }
        set { text = newValue }
    }
}
