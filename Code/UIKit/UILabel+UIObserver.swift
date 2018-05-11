import UIKit

extension UILabel: TextPresenter
{
    var presentedText: String?
    {
        get { return text }
        set { text = newValue }
    }
}
