//
//  Ramp.swift
//  RampUp
//
//  Created by soemsak on 5/8/2561 BE.
//  Copyright © 2561 soemsak.com. All rights reserved.
//

import UIKit
import SceneKit

class Ramp {
    
    class func getRampForName(rampName: String) -> SCNNode {
        switch rampName{
        case "pipe":
            return Ramp.getPipe()
        case "gun":
            return Ramp.getGun()
        case "pyramid":
            return Ramp.getPyramid()
        default:
            return Ramp.getPipe()
        }
    }
    
    class func getPipe() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/pipe.dae")
        let node = obj?.rootNode.childNode(withName: "pipe", recursively: true)!
        node?.scale = SCNVector3Make(0.0022, 0.0022, 0.0022)
        node?.position = SCNVector3Make(-1, 0.7, -1)
        return node!
    }
    
    class func getPyramid() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/pyramid.dae")
        let node = obj?.rootNode.childNode(withName: "pyramid", recursively: true)!
        node?.scale = SCNVector3Make(0.0058, 0.0058, 0.0058)
        node?.position = SCNVector3Make(-1, -0.45, -1)
        return node!
    }
    
    class func getGun() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/gun.dae")
        let node = obj?.rootNode.childNode(withName: "gun", recursively: true)!
        node?.scale = SCNVector3Make(0.1, 0.1, 0.1)
        node?.position = SCNVector3Make(-1, -1.9, -1)
        return node!
    }
    
    class func startRotation(node: SCNNode) {
        let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.01 * Double.pi), z: 0, duration: 0.1))
        node.runAction(rotate)
    }
}
