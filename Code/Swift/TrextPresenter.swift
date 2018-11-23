import SwiftObserver

public extension TextPresenter
{
    // MARK: Strings
    
    public func present<O: Observable>(_ text: O) where O.UpdateType == Update<String>
    {
        self.presentedText = text.latestUpdate.new
        observe(text) { [weak self] in self?.presentedText = $0.new }
    }
    
    public func present<O: Observable>(_ text: O) where O.UpdateType == Update<String?>
    {
        self.presentedText = text.latestUpdate.new
        observe(text) { [weak self] in self?.presentedText = $0.new }
    }
    
    public func present<O: Observable>(_ text: O) where O.UpdateType == String
    {
        self.presentedText = text.latestUpdate
        observe(text) { [weak self] in self?.presentedText = $0 }
    }
    
    public func present<O: Observable>(_ text: O) where O.UpdateType == String?
    {
        self.presentedText = text.latestUpdate
        observe(text) { [weak self] in self?.presentedText = $0 }
    }
    
    public func present(_ text: Variable<String>)
    {
        self.presentedText = text.value
        observe(text) { [weak self] in self?.presentedText = $0.new }
    }
    
    // MARK: Integers
    
    public func present<O: Observable>(_ text: O) where O.UpdateType == Update<Int>
    {
        setPresentedText(text.latestUpdate.new)
        observe(text) { [weak self] in self?.setPresentedText($0.new) }
    }
    
    public func present<O: Observable>(_ text: O) where O.UpdateType == Update<Int?>
    {
        setPresentedText(text.latestUpdate.new)
        observe(text) { [weak self] in self?.setPresentedText($0.new) }
    }
    
    public func present<O: Observable>(_ text: O) where O.UpdateType == Int
    {
        setPresentedText(text.latestUpdate)
        observe(text) { [weak self] in self?.setPresentedText($0) }
    }
    
    public func present<O: Observable>(_ text: O) where O.UpdateType == Int?
    {
        setPresentedText(text.latestUpdate)
        observe(text) { [weak self] in self?.setPresentedText($0) }
    }
    
    public func present(_ text: Variable<Int>)
    {
        observe(text) { [weak self] in self?.setPresentedText($0.new) }
    }
    
    public func setPresentedText(_ number: Int?)
    {
        presentedText =
        {
            guard let number = number else { return nil }
            
            return "\(number)"
        }()
    }
}

public protocol TextPresenter: Observer
{
    var presentedText: String? { get set }
}
