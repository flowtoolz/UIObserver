import UIKit

extension UITextField: TextPresenter
{
    var presentedText: String?
    {
        get { return text }
        set { text = newValue }
    }
}
