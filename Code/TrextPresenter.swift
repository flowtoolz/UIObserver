import SwiftObserver

extension TextPresenter
{
    // MARK: Strings
    
    func present<O: Observable>(_ text: O) where O.UpdateType == Update<String>
    {
        self.presentedText = text.latestUpdate.new
        observe(text) { [weak self] in self?.presentedText = $0.new }
    }
    
    func present<O: Observable>(_ text: O) where O.UpdateType == Update<String?>
    {
        self.presentedText = text.latestUpdate.new
        observe(text) { [weak self] in self?.presentedText = $0.new }
    }
    
    func present<O: Observable>(_ text: O) where O.UpdateType == String
    {
        self.presentedText = text.latestUpdate
        observe(text) { [weak self] in self?.presentedText = $0 }
    }
    
    func present<O: Observable>(_ text: O) where O.UpdateType == String?
    {
        self.presentedText = text.latestUpdate
        observe(text) { [weak self] in self?.presentedText = $0 }
    }
    
    func present(_ text: Variable<String>)
    {
        observe(text) { [weak self] in self?.presentedText = $0.new }
    }
    
    // MARK: Integers
    
    func present<O: Observable>(_ text: O) where O.UpdateType == Update<Int>
    {
        setPresentedText(text.latestUpdate.new)
        observe(text) { [weak self] in self?.setPresentedText($0.new) }
    }
    
    func present<O: Observable>(_ text: O) where O.UpdateType == Update<Int?>
    {
        setPresentedText(text.latestUpdate.new)
        observe(text) { [weak self] in self?.setPresentedText($0.new) }
    }
    
    func present<O: Observable>(_ text: O) where O.UpdateType == Int
    {
        setPresentedText(text.latestUpdate)
        observe(text) { [weak self] in self?.setPresentedText($0) }
    }
    
    func present<O: Observable>(_ text: O) where O.UpdateType == Int?
    {
        setPresentedText(text.latestUpdate)
        observe(text) { [weak self] in self?.setPresentedText($0) }
    }
    
    func present(_ text: Variable<Int>)
    {
        observe(text) { [weak self] in self?.setPresentedText($0.new) }
    }
    
    func setPresentedText(_ number: Int?)
    {
        presentedText =
        {
            guard let number = number else { return nil }
            
            return "\(number)"
        }()
    }
}

protocol TextPresenter: Observer
{
    var presentedText: String? { get set }
}
