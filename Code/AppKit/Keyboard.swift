import AppKit.NSEvent
import SwiftObserver
import SwiftyToolz

public let keyboard = Keyboard()

public class Keyboard: CustomObservable
{
    fileprivate init()
    {
        let monitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown)
        {
            [unowned self] event in
            
            self.send(event)
            
            return event
        }
        
        if monitor == nil { log(error: "Couldn't get event monitor.") }
    }
    
    public typealias Message = NSEvent
    
    public let messenger = Messenger(NSEvent())
}

