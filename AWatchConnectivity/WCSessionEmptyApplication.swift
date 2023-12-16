import Foundation
import WatchConnectivity

public protocol WCSessionApplication {
    
    @discardableResult
    func activate() -> Bool
    
    func activationDidComplete(_  activationState: WCSessionActivationState, error: Swift.Error?)
    
    #if os(iOS)
    
    func didBecomeInactive()
    
    func didDeactivate()
    
    #endif
    
    func didReceiveMessage(_ message: [String : Any])
    
    func didReceiveMessage(_ message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void)
    
}
