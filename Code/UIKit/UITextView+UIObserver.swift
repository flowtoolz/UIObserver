import UIKit

extension UITextView: TextPresenter
{
    var presentedText: String?
    {
        get { return text }
        set { if newValue != nil { text = newValue } }
    }
}
