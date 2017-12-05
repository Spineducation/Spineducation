//
//  ViewController.swift
//  SpineAR
//
//  Created by Maya Ramamurthy on 2017-10-04.
//  Copyright © 2017 CS Girls. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    
    @IBOutlet var sceneView: ARSCNView!
    var nodeModel:SCNNode!
    var bullseyeNode:SCNNode!
    let nodeName = "l4_Default" // Same name we set for the node on SceneKit's editor
    var spineExists = false;
    
    let bullseyeImage = UIImage(named: "bullseye.png")
    
    
    @IBAction func Menu(_ sender: Any) {
        print("click")
    }
    
    let spine = SCNScene(named: "art.scnassets/spine-collection-of-thunthu/4cylinders.dae")! // sets the spine to spine 3d image file
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // makes edges smooth
        sceneView.antialiasingMode = .multisampling4X
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        
        let scene = SCNScene()
        
        nodeModel =  scene.rootNode.childNode(withName: nodeName, recursively: true)
        
        
        //    spine.rootNode.position = SCNVector3Make(1, 0,1)
        
        sceneView.scene.rootNode.addChildNode(spine.rootNode) // add this to the sc
        
        self.sceneView.autoenablesDefaultLighting = true
        self.sceneView.antialiasingMode = .multisampling4X
        
        // Set the scene to the view
        sceneView.scene = scene
        //let ballNode = make2dNode(image: "⭕️".image()!)
        //scene.rootNode.addChildNode(ballNode)
        
        //scene.background.contents = UIImage(named: "art.scnassets/bullseye.png")
       
     //   let camera = self.sceneView.pointOfView!
       // let dimensions = SCNVector3(0, 0, -1)
        //bullseyeNode.position = camera.convertPosition(dimensions, to: nil)
        let bullseyeNode = make2dNode(image: bullseyeImage!);
         bullseyeNode.position = SCNVector3Make(0, 0, -1)
     //   bullseyeNode.rotation = camera.rotation
     //   scene.rootNode.addChildNode(bullseyeNode)
       // sceneView.pointOfView?.addChildNode(bullseyeNode)
        sceneView.pointOfView?.addChildNode(bullseyeNode)
    }
    
    func make2dNode(image: UIImage, width: CGFloat = 0.1, height: CGFloat = 0.1) -> SCNNode {
        let plane = SCNPlane(width: width, height: height)
        plane.firstMaterial!.diffuse.contents = image
        let node = SCNNode(geometry: plane)
        node.constraints = [SCNBillboardConstraint()]
        return node
    }
    
    // create a torus shaped object
    func createTarget(position : SCNVector3){
        let torus = SCNTorus(ringRadius: 0.05, pipeRadius: 0.02)
        var targetNode =  SCNNode (geometry : torus)
        let camera = self.sceneView.pointOfView!
        targetNode.position = camera.convertPosition(position, to: nil)
        
        targetNode.rotation = camera.rotation
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(5*Double.pi), z: 0, duration: 1)
        targetNode.runAction(action, forKey: "myrotate")
        sceneView.scene.rootNode.addChildNode(targetNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //   navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func sceneSpacePosition(inFrontOf node: SCNNode) -> SCNVector3 {
        let localPosition = SCNVector3(x: 1, y: 0, z: -1)
        let scenePosition = node.convertPosition(localPosition, to: nil)
        // to: nil is automatically scene space
        print("THIS IS THE SCENE POSITION RELATIVE TO CAMERA")
        print(scenePosition)
        return scenePosition
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let location = touches.first!.location(in: sceneView)
        //   guard let touch = touches.first else {
        //     return}
        //let result = sceneView.hitTest(touch.location(in: sceneView), types: ARHitTestResult.ResultType.featurePoint)
        
        // uncomment this out if create spine mode
         if (!spineExists){
            createSpine(position: SCNVector3Make(1,1,-1))
            spineExists = true;
        }
        if (spineExists){
           // Get the location of the target in Vector3 coordinates
            let targetPosition = sceneView.projectPoint(self.sceneView.pointOfView!.position)
            // Convert the SCNVector3 Point to a CGPoint to compare for hittest
            let cgTarget = CGPoint(x:CGFloat(targetPosition.x), y: CGFloat(targetPosition.y))
            var hitTestOptions = [SCNHitTestOption: Any]()
            hitTestOptions[SCNHitTestOption.boundingBoxOnly] = true
            // if comparing touch location to pedical location; not necessary atm
           // let hitResults: [SCNHitTestResult]  = sceneView.hitTest(location, options: hitTestOptions)
            // check if the location the target was = a pedical
            let hitResults: [SCNHitTestResult]  = sceneView.hitTest(cgTarget , options: hitTestOptions)
            if let hit = hitResults.first {
                print(hit.node.name)
            }
            
        }
        
        //  if (spineExists){
        //print (spine.rootNode.childNode(withName: "Cylinder@", recursively: true));
        //   print (nodeName);
        // }
        
        //   createSpine (position: sceneSpacePosition (inFrontOf: spine.rootNode))
        // call on didTap method to draw the spine if the position has been clicked
        //let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap(withGestureRecognizer:)))
        //sceneView.addGestureRecognizer(tapGestureRecognizer)
        /*
         guard let hitResult = result.last else {return}
         let hitTransform = SCNMatrix4(hitResult.worldTransform) // make SCNMatrix4 object out of touch location
         let hitVector = SCNVector3Make(hitTransform.m41, hitTransform.m42, hitTransform.m43) // take relevant components of the touch location from matrix to make SVNVector3 object
         
         if (!spineExists){ // if the spine is not on the screen yet
         createSpine(position: hitVector) // create the spine
         spineExists = true // update the variable to reflect that the spine exists now
         }*/
    }
    
    @objc func didTap(withGestureRecognizer recognizer: UIGestureRecognizer) {
        let tapLocation = recognizer.location(in: sceneView)
        let hitTestResults = sceneView.hitTest(tapLocation)
        let result = sceneView.hitTest(tapLocation, types: ARHitTestResult.ResultType.featurePoint)
        //guard
        let hitResult = result.last //else {return}
        guard let node = hitTestResults.first?.node else {
            let hitTestResultsWithFeaturePoints = sceneView.hitTest(tapLocation, types: .featurePoint)
            if  (hitTestResultsWithFeaturePoints.first != nil) {
                let hitTransform = SCNMatrix4((hitResult?.worldTransform)!) // make SCNMatrix4 object out of touch location
                let hitVector = SCNVector3Make(hitTransform.m41, hitTransform.m42, hitTransform.m43) // take relevant components of the touch location
                createSpine(position: hitVector)
            }
            else {
                //      createSpine(position: SCNVector3Make(1,0,-1))
                //    print("SPINE MADE WITH 1 0 -1")
            }
            return
        }
        spine.rootNode.removeFromParentNode()
    }
    
    func createSpine(position : SCNVector3){
        nodeModel =  spine.rootNode.childNode( withName: nodeName, recursively: true)// recursively binds child node to root node
        //      spine.rootNode.position = SCNVector3Make(position.x,position.y + 0.5,position.z) // sets the position of root node
        //      spine.rootNode.position = position // sets the position of the root node to the position from the SVNVector3 object
        let camera = self.sceneView.pointOfView!
        //      spine.rootNode.position = sceneSpacePosition(inFrontOf: camera)
        spine.rootNode.position = camera.convertPosition(position, to: nil)
        spine.rootNode.rotation = camera.rotation
        sceneView.scene.rootNode.addChildNode(spine.rootNode) // add this to the scene
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    /*
     Called when a SceneKit node corresponding to a
     new AR anchor has been added to the scene.
     */
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // Place content only for anchors found by plane detection.
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        // Create a SceneKit plane to visualize the plane anchor using its position and extent.
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        let planeNode = SCNNode(geometry: plane)
        planeNode.simdPosition = float3(planeAnchor.center.x, 0, planeAnchor.center.z)
        
        /*
         `SCNPlane` is vertically oriented in its local coordinate space, so
         rotate the plane to match the horizontal orientation of `ARPlaneAnchor`.
         */
        planeNode.eulerAngles.x = -.pi / 2
        
        // Make the plane visualization semitransparent to clearly show real-world placement.
        planeNode.opacity = 0.25
        
        /*
         Add the plane visualization to the ARKit-managed node so that it tracks
         changes in the plane anchor as plane estimation continues.
         */
        node.addChildNode(planeNode)
    }
    
    /*
     Called when a SceneKit node's properties have been
     updated to match the current state of its corresponding anchor.
     */
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        // Update content only for plane anchors and nodes matching the setup created in `renderer(_:didAdd:for:)`.
        guard let planeAnchor = anchor as?  ARPlaneAnchor,
            let planeNode = node.childNodes.first,
            let plane = planeNode.geometry as? SCNPlane
            else { return }
        
        // Plane estimation may shift the center of a plane relative to its anchor's transform.
        planeNode.simdPosition = float3(planeAnchor.center.x, 0, planeAnchor.center.z)
        
        /*
         Plane estimation may extend the size of the plane, or combine previously detected
         planes into a larger one. In the latter case, `ARSCNView` automatically deletes the
         corresponding node for one plane, then calls this method to update the size of
         the remaining plane.
         */
        plane.width = CGFloat(planeAnchor.extent.x)
        plane.height = CGFloat(planeAnchor.extent.z)
    }
    
    /*
     Called when SceneKit node corresponding to a removed
     AR anchor has been removed from the scene.
     */
    func renderer(_ renderer: SCNSceneRenderer,
                  didRemove node: SCNNode, for anchor: ARAnchor) {
        // ...
    }
    
}

