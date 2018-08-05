//
//  RampPickerViewController.swift
//  RampUp
//
//  Created by soemsak on 4/8/2561 BE.
//  Copyright © 2561 soemsak.com. All rights reserved.
//

import UIKit
import SceneKit

class RampPickerViewController: UIViewController {
    
    var sceneView: SCNView!
    var size: CGSize!
    var viewController: ViewController!
    
    init(size: CGSize) {
        super.init(nibName: nil, bundle: nil)
        self.size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.frame = CGRect(origin: CGPoint.zero, size: size)
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        view.insertSubview(sceneView, at: 0)
        preferredContentSize = size
        
        let scene = SCNScene(named: "art.scnassets/ramps.scn")!
        sceneView.scene = scene
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tap)
        
        let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        scene.rootNode.camera = camera
        
        let pipe = Ramp.getPipe()
        Ramp.startRotation(node: pipe)
        scene.rootNode.addChildNode(pipe)
        
        let pyramid = Ramp.getPyramid()
        Ramp.startRotation(node: pyramid)
        scene.rootNode.addChildNode(pyramid)
        
        let gun = Ramp.getGun()
        Ramp.startRotation(node: gun)
        scene.rootNode.addChildNode(gun)
        
        /*let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.05 * Double.pi), z: 0, duration: 0.1))
        
        let obj = SCNScene(named: "art.scnassets/pipe.dae")!
        let node = obj.rootNode.childNode(withName: "pipe", recursively: true)!
        node.scale = SCNVector3Make(0.0022, 0.0022, 0.0022)
        node.position = SCNVector3Make(-1, 0.7, -1)
        node.runAction(rotate)
        scene.rootNode.addChildNode(node)
        
        let obj1 = SCNScene(named: "art.scnassets/pyramid.dae")!
        let node1 = obj1.rootNode.childNode(withName: "pyramid", recursively: true)!
        node1.scale = SCNVector3Make(0.006, 0.006, 0.006)
        node1.position = SCNVector3Make(-1, -0.3, -1)
        node1.runAction(rotate)
        scene.rootNode.addChildNode(node1)
        
        let obj2 = SCNScene(named: "art.scnassets/gun.dae")!
        let node2 = obj2.rootNode.childNode(withName: "gun", recursively: true)!
        node2.scale = SCNVector3Make(0.1, 0.1, 0.1)
        node2.position = SCNVector3Make(-1, -1.9, -1)
        node2.runAction(rotate)
        scene.rootNode.addChildNode(node2)*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleTap(_ gestureRecognizer: UIGestureRecognizer) {
        let p = gestureRecognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(p, options: [:])
        
        if hitResults.count > 0 {
            let node = hitResults[0].node
            viewController.onRampSelected(node.name!)
            dismiss(animated: true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
