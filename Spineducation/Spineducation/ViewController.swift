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
    var targetModel:SCNNode!
    var bullseyeNode:SCNNode!
    let nodeName = "l4_Default" // Same name we set for the node on SceneKit's editor
    var spineExists = false;
    
    let bullseyeImage = UIImage(named: "bullseye_black.png")?.withRenderingMode(.alwaysOriginal)
    
    
    @IBAction func Menu(_ sender: Any) {
        print("click")
    }
    
    let target = SCNScene(named: "bullseye.dae")!
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

        
        //scene.background.contents = UIImage(named: "art.scnassets/bullseye.png")
       
     //   let camera = self.sceneView.pointOfView!
       // let dimensions = SCNVector3(0, 0, -1)
        //bullseyeNode.position = camera.convertPosition(dimensions, to: nil)
        //let colour = UIColor.red
        //let newBullseyeImage = filledImage(source: bullseyeImage!, fillColor: UIColor.red)
        let bullseyeNode = make2dNode(image: bullseyeImage!, width: CGFloat(0.025), height: CGFloat(0.025))
        
        //bullseyeNode.scale = SCNVector3(5,5,5)
        // testing size
        //bullseyeNode.position = SCNVector3Make(0, 0, -0.5)
        // actual size
        bullseyeNode.position = SCNVector3Make(0, 0, -0.1)
     //   bullseyeNode.rotation = camera.rotation
     //   scene.rootNode.addChildNode(bullseyeNode)
       sceneView.pointOfView?.addChildNode(bullseyeNode)
        
    
     //    sceneView.pointOfView?.addChildNode(bullseyeNode)
       // bullseyeNode.geometry?.firstMaterial?.diffuse.contents  = UIColor.red
        // NOTE - NEVER TRY TO COLOUR A NODE - IT DOESN'T WORK IT JUST TURNS THE WHOLE AREA THE NODE WOULD TAKE UP INTO WHATEVER COLOUR YOU SPECIFIED
        
        
     //   targetModel =  target.rootNode.childNode( withName: nodeName, recursively: true)// recursively binds child node to root
   //     target.rootNode.position = SCNVector3Make(0, 0, -0.1)
     //   scene.rootNode.addChildNode(targetModel)
   //     sceneView.pointOfView?.addChildNode(target.rootNode)
    //    sceneView.scene.rootNode.addChildNode(target.rootNode) // add this to the scene
    }
    
    func filledImage(source: UIImage, fillColor: UIColor) -> UIImage { // useless, was trying to use to fill an image with red, didn't work to make the back of the target red, used this way for future reference filledImage(source: bullseyeImage!, fillColor: UIColor.red)
        
        UIGraphicsBeginImageContextWithOptions(source.size, false, UIScreen.main.scale)
        
        let context = UIGraphicsGetCurrentContext()
        fillColor.setFill()
        
        context!.translateBy(x: 0, y: source.size.height)
        context!.scaleBy(x: 1.0, y: -1.0)
        
        context!.setBlendMode(CGBlendMode.colorBurn)
        let rect = CGRect(x: 0, y: 0, width: source.size.width, height: source.size.height)
        context!.draw(source.cgImage!, in: rect)
        
        context!.setBlendMode(CGBlendMode.sourceIn)
        context!.addRect(rect)
        context!.drawPath(using: CGPathDrawingMode.fill)
        
        let coloredImg : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return coloredImg
    }
    
    
    func make2dNode(image: UIImage, width: CGFloat, height: CGFloat) -> SCNNode { // TO CHANGE SIZE OF BULLSEYE, CGFLOAT WIDTH AND HEIGHT NEED TO BE CHANGED (0.01 TO 0.1 WILL MAKE IT 10X BIGGER) // actual size is 0.1
        let plane = SCNPlane(width: width, height: height)
        plane.firstMaterial!.diffuse.contents = image
        let node = SCNNode(geometry: plane)
        //node.scale = SCNVector3(5,5,5)
        node.constraints = [SCNBillboardConstraint()]
        return node
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
    // new code trial
    @objc func tapped(recognizer :UITapGestureRecognizer) {
        let sceneView = recognizer.view as! ARSCNView
        let touchLocation = recognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(touchLocation, options: [:])
        if !hitResults.isEmpty {
            // this means the node has been touched
            print("the new code was reached chill")
        }
    }
    
    private func registerGestureRecognizers() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    // end new code trial
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent? ) {
        /*let sceneView = recognizer.view as! ARSCNView
        let location = recognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(location, options: [:])
        if !hitResults.isEmpty {
            // this means the node has been touched
            print("the new code was reached chill")
        }*/
        let location = touches.first!.location(in: sceneView)
        // uncomment this out if create spine mode
         if (!spineExists){
            // actual size of spine
          //  createSpine(position: SCNVector3Make(1,1,-1))
            // testing size for spine to see if can do surgery cause we cs not surgeons and that  hard
            createSpine(position: SCNVector3Make(1,1,-0.65))
            spineExists = true;
        }
        if (spineExists){
           // Get the location of the target in Vector3 coordinates
            let targetPosition = sceneView.projectPoint(self.sceneView.pointOfView!.position)
           // print (targetPosition)
            // Convert the SCNVector3 Point to a CGPoint to compare for hittest
            let cgTarget = CGPoint(x:CGFloat(targetPosition.x), y: CGFloat(targetPosition.y))
            print (cgTarget)
            let ballNode = make2dNode(image: "⭕️".image()!, width: 2, height: 2)
            let markedPosition = SCNVector3(CGFloat(targetPosition.x), CGFloat(targetPosition.y),-1)
            print(markedPosition)
            ballNode.position = markedPosition
            sceneView.scene.rootNode.addChildNode(ballNode)
            //markStartPoint(point: cgTarget)
            var hitTestOptions = [SCNHitTestOption: Any]()
            hitTestOptions[SCNHitTestOption.clipToZRange] = true // hit-testing searches only objects between the zNear and zFar distances of the pointOfView camera
            //hitTestOptions[SCNHitTestOption.firstFoundOnly] = true // array of hit-test results contains only the first object found (which is not necessarily the nearest)
            hitTestOptions[SCNHitTestOption.boundingBoxOnly] = true // optimize search performance, but geometric accuracy sucks
            hitTestOptions[SCNHitTestOption.ignoreHiddenNodes] = false // DON'T COMMENT THIS OUT / DELETE, NEEDED (default val is true, without this line it ignores hidden nodes when searching which node hit)
            // if comparing touch location to pedical location; not necessary atm
           // let hitResults: [SCNHitTestResult]  = sceneView.hitTest(location, options: hitTestOptions)
            // check if the location the target was = a pedical
            let hitResults: [SCNHitTestResult]  = sceneView.hitTest(cgTarget , options: hitTestOptions)
            //CGRectContainsPoint(spine, point)
            //print("THIS IS THE START OF A HIT TEST RESULT")
            //print(hitResults)
            //print("THIS IS THE END OF A HIT TEST RESULT")
            if let hit = hitResults.first {
                print(hit.node.name)
            }
            
        }
        
    }
    
   /* func markStartPoint(point : CGPoint){ just creates a circle, moves with the camera, would've probably been useful for target but 
        let circlePath = UIBezierPath(arcCenter: point, radius: CGFloat(1), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.red.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 1.0
        
        view.layer.addSublayer(shapeLayer)
    }
    */
   
    
    func createSpine(position : SCNVector3){
        nodeModel =  spine.rootNode.childNode( withName: nodeName, recursively: true)// recursively binds child node to root
        let camera = self.sceneView.pointOfView!
        //      spine.rootNode.position = sceneSpacePosition(inFrontOf: camera)
        spine.rootNode.position = camera.convertPosition(position, to: nil)
        spine.rootNode.rotation = camera.rotation
        //if (bullseyeNode != nil) { bullseyeNode.rotation = SCNVector4(1,1,1,1) }else {print ("Hi");return} // TRIED TO ROTATE THE BULLSEYE IF THE SPINE IS BEING CREATED BUT THE BULLSEYENODE TURNS OUT TO BE NIL EVERYTIME
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

