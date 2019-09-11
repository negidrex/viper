//
//  XMPPWorker.swift
//  SampleProject
//
//  Created by IOSDev on 11/09/2019.
//  Copyright © 2019 IOSDev. All rights reserved.
//

import Foundation
import XMPPFramework

enum XMPPControllerError : Error {
    case wrongUserJID
}

class XMPPWorker : NSObject {
    var xmppStream : XMPPStream
    
    var xmppWorkerOutput : XMPPWorkerOutput?
    
    let hostname : String
//    let userJID : XMPPJID
    let hostPort : UInt16
    var password : String?
    
    init(hostname: String, hostPort: UInt16 = 5222){
    
        self.hostname = hostname
//        self.userJID = userJID
        self.hostPort = hostPort
//        self.password = password
        
        self.xmppStream = XMPPStream()
        self.xmppStream.hostName = hostname
        self.xmppStream.hostPort = hostPort
        self.xmppStream.startTLSPolicy = .allowed
//        self.xmppStream.myJID = userJID
        
        super.init()
        
        self.xmppStream.addDelegate(self, delegateQueue: DispatchQueue.main)
        
    }
    
    public func connect( userJIDString: String, password: String) throws {
        guard let userJID = XMPPJID(string: userJIDString) else {
            throw XMPPControllerError.wrongUserJID
        }
        
        self.xmppStream.myJID = userJID
        self.password = password
        if !self.xmppStream.isDisconnected {
            return
        }
        
        try! self.xmppStream.connect(withTimeout: XMPPStreamTimeoutNone)
    }
}


extension XMPPWorker : XMPPStreamDelegate {
    
    func xmppStream(_ sender: XMPPStream, didNotAuthenticate error: DDXMLElement) {
        self.xmppWorkerOutput?.authenticated(success: false, error: error.localName)
    }
    
    func xmppStreamDidConnect(_ sender: XMPPStream) {
        print("Connected")
        
        try! sender.authenticate(withPassword: self.password ?? "")
    }
    
    func xmppStreamDidAuthenticate(_ sender: XMPPStream) {
        self.xmppStream.send(XMPPPresence())
        print("Stream: Authenticated")
        
        
    }
}
