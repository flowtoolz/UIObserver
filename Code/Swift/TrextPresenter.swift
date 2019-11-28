import SwiftObserver

public extension TextPresenter
{
    // MARK: Strings
    
    func present<O: BufferedObservable>(_ text: O) where O.Message == Change<String>
    {
        self.presentedText = text.latestMessage.new
        observe(text) { [weak self] in self?.presentedText = $0.new }
    }
    
    func present<O: BufferedObservable>(_ text: O) where O.Message == Change<String?>
    {
        self.presentedText = text.latestMessage.new
        observe(text) { [weak self] in self?.presentedText = $0.new }
    }
    
    func present<O: BufferedObservable>(_ text: O) where O.Message == String
    {
        self.presentedText = text.latestMessage
        observe(text) { [weak self] in self?.presentedText = $0 }
    }
    
    func present<O: BufferedObservable>(_ text: O) where O.Message == String?
    {
        self.presentedText = text.latestMessage
        observe(text) { [weak self] in self?.presentedText = $0 }
    }
    
    func present(_ text: Variable<String>)
    {
        self.presentedText = text.value
        observe(text) { [weak self] in self?.presentedText = $0.new }
    }
    
    // MARK: Integers
    
    func present<O: BufferedObservable>(_ text: O) where O.Message == Change<Int>
    {
        setPresentedText(text.latestMessage.new)
        observe(text) { [weak self] in self?.setPresentedText($0.new) }
    }
    
    func present<O: BufferedObservable>(_ text: O) where O.Message == Change<Int?>
    {
        setPresentedText(text.latestMessage.new)
        observe(text) { [weak self] in self?.setPresentedText($0.new) }
    }
    
    func present<O: BufferedObservable>(_ text: O) where O.Message == Int
    {
        setPresentedText(text.latestMessage)
        observe(text) { [weak self] in self?.setPresentedText($0) }
    }
    
    func present<O: BufferedObservable>(_ text: O) where O.Message == Int?
    {
        setPresentedText(text.latestMessage)
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

public protocol TextPresenter: Observer
{
    var presentedText: String? { get set }
}
