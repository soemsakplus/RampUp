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
    
    weak var rampPlacerVC: ViewController!
    
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
        
        let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        scene.rootNode.camera = camera
        
        let obj = SCNScene(named: "art.scnassets/pipe.dae")!
        let node = obj.rootNode.childNode(withName: "pipe", recursively: true)!
        node.scale = SCNVector3Make(0.0022, 0.0022, 0.0022)
        node.position = SCNVector3Make(-1, 0.7, -1)
        scene.rootNode.addChildNode(node)
        
        let obj1 = SCNScene(named: "art.scnassets/pyramid.dae")!
        let node1 = obj1.rootNode.childNode(withName: "pyramid", recursively: true)!
        node1.scale = SCNVector3Make(0.006, 0.006, 0.006)
        node1.position = SCNVector3Make(-1, -0.3, -1)
        scene.rootNode.addChildNode(node1)
        
        let obj2 = SCNScene(named: "art.scnassets/quarter.dae")!
        let node2 = obj2.rootNode.childNode(withName: "quarter", recursively: true)!
        node2.scale = SCNVector3Make(0.006, 0.006, 0.006)
        node2.position = SCNVector3Make(-1, -1.9, -1)
        scene.rootNode.addChildNode(node2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
