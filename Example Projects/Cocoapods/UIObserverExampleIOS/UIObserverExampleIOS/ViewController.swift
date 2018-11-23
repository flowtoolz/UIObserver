import UIKit
import GetLaid
import UIObserver
import SwiftObserver

class ViewController: UIViewController, Observer
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        titleUpdateButton.constrainToParentExcludingBottom()
        titleUpdateButton.constrainHeight(to: 100)
        
        exampleField.constrainLeftToParent()
        exampleField.constrainRightToParent()
        exampleField.constrain(above: exampleButton)
        exampleField.constrainHeight(to: 100)
        
        exampleButton.constrainToParentExcludingTop()
        exampleButton.constrainHeight(to: 100)
        
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
        let button = view.addForAutoLayout(UIButton())
        
        button.backgroundColor = UIColor.red
        button.setupObservability()
        button.present(observableTitle)
        
        return button
    }()
    
    private lazy var exampleField: UITextField =
    {
        let field = view.addForAutoLayout(UITextField())
        
        field.present(mappingForField)
        field.backgroundColor = UIColor.green
        field.textAlignment = .center

        return field
    }()
    
    private lazy var mappingForField = observableTitle.new().unwrap("").map
    {
        "Length of Button Title: \($0.count)"
    }

    private let observableTitle = Var("Tap Me and Watch the Console")
}

