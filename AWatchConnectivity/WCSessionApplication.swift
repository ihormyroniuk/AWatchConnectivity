import Foundation
import WatchConnectivity

open class WCSessionEmptyApplication: WCSessionApplication {
    
    // MARK: - WCSession
    
    public let session = WCSession.default

    
    // MARK: - Initialization
      
    public init() {
        setup()
    }
  
    // MARK: - Setup
  
    open func setup() {
        session.delegate = wcSessionDelegateProxy
        wcSessionDelegateProxy.sessionEmptyApplication = self
    }
    
    // MARK: - Activation
    
    @discardableResult
    open func activate() -> Bool {
        guard WCSession.isSupported() else { return false }
        session.activate()
        return true
    }
    
    // MARK: - WCSessionDelegate
    
    private class WCSessionDelegateProxy: NSObject, WCSessionDelegate {
        
        weak var sessionEmptyApplication: WCSessionEmptyApplication?
                
        func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Swift.Error?) {
            sessionEmptyApplication?.activationDidComplete(activationState, error: error)
        }
        
        #if os(iOS)
        
        func sessionDidBecomeInactive(_ session: WCSession) {
            sessionEmptyApplication?.didBecomeInactive()
        }
        
        func sessionDidDeactivate(_ session: WCSession) {
            sessionEmptyApplication?.didDeactivate()
        }
        
        #endif
        
        func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
            sessionEmptyApplication?.didReceiveMessage(message)
        }
        
        func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
            sessionEmptyApplication?.didReceiveMessage(message, replyHandler: replyHandler)
        }
        
    }
    
    private let wcSessionDelegateProxy = WCSessionDelegateProxy()
    
    open func activationDidComplete(_  activationState: WCSessionActivationState, error: Swift.Error?) {
        
    }
    
    #if os(iOS)
    
    open func didBecomeInactive() {
        
    }
    
    open func didDeactivate() {
        
    }
    
    #endif
    
    open func didReceiveMessage(_ message: [String : Any]) {
        
    }
    
    open func didReceiveMessage(_ message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
    }
    
}
