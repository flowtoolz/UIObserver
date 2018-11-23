import UIKit
import GetLaid
import UIObserver
import SwiftObserver

class ViewController: UIViewController, Observer
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        exampleButton.constrainToParentExcludingTop()
        exampleButton.constrainHeight(to: 100)
        
        titleUpdateButton.constrainToParentExcludingBottom()
        titleUpdateButton.constrainHeight(to: 100)
        
        observe(exampleButton)
        {
            event in
            
            switch event
            {
            case .touchDown: print("touchDown")
            case .touchUpInside: print("touchUpInside")
            case .touchUpOutside: print("touchUpOutside")
            case .touchCancel: print("touchCancel")
            default: print("control event value: \(event.rawValue)")
            }
        }
    }
    
    private lazy var titleUpdateButton: UIButton =
    {
        let btn = view.addForAutoLayout(UIButton())
        
        btn.addTarget(self,
                      action: #selector(modifyObservableTitle),
                      for: .touchUpInside)
        btn.backgroundColor = UIColor.red
        btn.setTitle("Modify Other Button Title", for: .normal)
        
        return btn
    }()
    
    @objc private func modifyObservableTitle()
    {
        observableTitle <- (observableTitle.value ?? "") + "_*"
    }
    
    private lazy var exampleButton: UIButton =
    {
        let btn = view.addForAutoLayout(UIButton())
        
        btn.backgroundColor = UIColor.red
        btn.setupObservability()
        btn.present(observableTitle)
        
        return btn
    }()
    
    private let observableTitle = Var("Tap Me and Watch the Console")
}

