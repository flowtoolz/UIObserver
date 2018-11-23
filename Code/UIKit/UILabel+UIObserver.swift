import UIKit

extension UILabel: TextPresenter
{
    public var presentedText: String?
    {
        get { return text }
        set { text = newValue }
    }
}
