import UIKit

extension UITextView: TextPresenter
{
    public var presentedText: String?
    {
        get { return text }
        set { if newValue != nil { text = newValue } }
    }
}
