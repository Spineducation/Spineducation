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
    var clickSpineNode:SCNNode!
    
    let textNode = SCNNode()
    let nodeName = "l4_Default" // Same name we set for the node on SceneKit's editor
    var targetExists = false;
    var reposition = false;
    var pedicle = false;
    var targetLocked = false;
    var target = SCNVector3();
    var trajectoryExists = false;
    //var target = SCNVector3();
    
   // clickSpine.materials = [clickMaterial]
    
    let bullseyeImage = UIImage(named: "bullseye.png")?.withRenderingMode(.alwaysOriginal)
    
    
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
        
        let scene = SCNScene()
        
        nodeModel =  scene.rootNode.childNode(withName: nodeName, recursively: true)
        
        sceneView.scene.rootNode.addChildNode(spine.rootNode)
        
        self.sceneView.autoenablesDefaultLighting = true
        self.sceneView.antialiasingMode = .multisampling4X
        
        // Set the scene to the view
        sceneView.scene = scene
        
       
        
        showUserInstruction(instruction: "Tap to add spine", xVal: -0.425)
    }
    
    // add the target to the screen
    func showTarget(){
        let bullseyeNode = make2dNode(image: bullseyeImage!, width: CGFloat(0.001), height: CGFloat(0.001)) // use width and height to adjust size of bullseye
        
        //bullseyeNode.position = SCNVector3Make(0, 0, -0.01) // create bullseye node extremely close to camera so that user can view and target pedacles close up
        bullseyeNode.position = SCNVector3Make(0, 0, -0.01)
        
        sceneView.pointOfView?.addChildNode(bullseyeNode) // add the bullseyeNode as a child of the point of view (camera) so that image moves with camera
    }
    func showUserInstruction (instruction: String, xVal: Float){
        if ((instruction == "Reposition as needed" && reposition) || (instruction == "Tap pedicle start point" && pedicle)){ // doesn't allow the textnode for instructions that have already occurred to be re-positioned, seems to fix the problem of moving instructions around screen when user repositions spine
            return;
        }
            let clickSpine = SCNText (string: instruction, extrusionDepth: 1)
            let clickMaterial = SCNMaterial()
            
            clickMaterial.diffuse.contents = UIColor.white
            clickSpine.materials = [clickMaterial]
            let cameraPos = self.sceneView.pointOfView!.position
            textNode.position = SCNVector3(cameraPos.x + xVal, cameraPos.y-0.5, cameraPos.z - 2);
            //textNode.position = SCNVector3(cameraPos.x + xVal, cameraPos.y-1, cameraPos.z-2);
            textNode.scale = SCNVector3Make(0.01, 0.01, 0.01)
            textNode.geometry = clickSpine
            textNode.geometry?.firstMaterial?.diffuse.contents  = UIColor.white
            //sceneView.scene.rootNode.addChildNode(textNode) adds the text as a child node of the whole scene, making it show up in one static place
            sceneView.pointOfView?.addChildNode(textNode) // adds the text as a child node of the point of view, so it follows the user until they select an area for the target
    }
    
    func make2dNode(image: UIImage, width: CGFloat, height: CGFloat) -> SCNNode {
        let plane = SCNPlane(width: width, height: height)
        plane.firstMaterial!.diffuse.contents = image
        let node = SCNNode(geometry: plane)
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
        return scenePosition
    }
    
    func drawTrajectory (targetPosition : SCNVector3) {
   /*     print(targetPosition)
        let camera = self.sceneView.pointOfView!
        let position = camera.convertPosition(SCNVector3(0, -0.1, 0), to: nil)
        // try converting the target Position to camera position?
   //     let targetPosition = camera.convertPosition(SCNVector3(targetPosition.x, targetPosition.y - 1, targetPosition.z), to: nil)
     //   let targetPosition = camera.convertPosition(targetPosition, to: nil)
        // draw a line from the targetPosition selected previously, to the
        let line = SCNGeometry.lineFrom(vector: targetPosition, toVector: position)
        //let line = SCNGeometry.lineFrom(vector: targetPosition, toVector: position)
        let lineNode = SCNNode(geometry: line)
     //   lineNode.position = SCNVector3Zero
        sceneView.scene.rootNode.addChildNode(lineNode)
      //  sceneView.pointOfView?.addChildNode(lineNode)
        
        */
        // I can't figure out how to make it to go from target to camera, so I just did camera to 0,0,0 so they can select the angle whoops
       let camera = self.sceneView.pointOfView!
        let position = camera.convertPosition(SCNVector3(0, -0.1, 0), to: nil)
        //let line = SCNGeometry.lineFrom(fromVector: camera.position, toVector: position)
        print("camera needs to be in position now - 6 second warning")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) {
            let line = SCNGeometry.lineFrom(fromVector: targetPosition, toVector: camera.position)
            //let otherLine = buildLineInTwoPointsWithRotation(fromstartPoint: targetPosition, toendPoint: camera.position, radius: 3, color: UIColor.red)
            let twoPointsNode1 = SCNNode() //trying to make a cylinder, still doesn't point the right way
            print("camera position is ", camera.position," position is ", position, "target position is ", targetPosition);
            self.sceneView.scene.rootNode.addChildNode(twoPointsNode1.cylinderLine(fromstartPoint: targetPosition, toendPoint: position, radius: 0.05, color: .red))
            //self.sceneView.pointOfView?.addChildNode(twoPointsNode1.cylinderLine(fromstartPoint: camera.position, toendPoint: targetPosition, radius: 0.05, color: .red))
            let lineNode = SCNNode(geometry: line)
            lineNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
            self.sceneView.scene.rootNode.addChildNode(lineNode)
            //self.sceneView.pointOfView?.addChildNode(lineNode)
            print("line created")
        }
        
        

        //  sceneView.pointOfView?.addChildNode(lineNode)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent? ) {
      //  var targetPosition: SCNVector3
        let location = touches.first!.location(in: sceneView)
        // uncomment this out if create spine mode
        
         if (!targetExists){ // if the target does not exist, spine can and should still be able to be repositioned
            createSpine(position: SCNVector3Make(1,1,-0.65)) // create the spine
            textNode.removeFromParentNode() // remove instruction text asking user to tap to create spine
            
            showUserInstruction(instruction: "Reposition as needed", xVal: -0.62)
            reposition = true // bool will be checked when showUserInstruction gets called again on next touch, disallowing this instruction to be recreated and thus repositioned on next touch
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) { // remove "resposition as needed" text after 6 seconds
                self.textNode.removeFromParentNode()
                self.showTarget()
                self.showUserInstruction(instruction: "Tap pedicle\n start point", xVal: -0.3)
                self.pedicle = true // bool will be checked when showUserInstruction gets called again on next touch, disallowing this instruction to be recreated and thus repositioned on next touch
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { // remove tap pedicle text node after 3 seconds
                    self.textNode.removeFromParentNode()
                }
                self.targetExists = true
            }
        }
        if (targetExists && !targetLocked){
           // Get the location of the target in Vector3 coordinates
            let targetPosition = sceneView.projectPoint(self.sceneView.pointOfView!.position)
            // Convert the SCNVector3 Point to a CGPoint to compare for hittest
            var hitTestOptions = [SCNHitTestOption: Any]()
            hitTestOptions[SCNHitTestOption.clipToZRange] = true // hit-testing searches only objects between the zNear and zFar distances of the pointOfView camera
            //hitTestOptions[SCNHitTestOption.firstFoundOnly] = true // array of hit-test results contains only the first object found (which is not necessarily the nearest)
            hitTestOptions[SCNHitTestOption.boundingBoxOnly] = true // optimize search performance, but geometric accuracy suffers
            hitTestOptions[SCNHitTestOption.ignoreHiddenNodes] = false // DON'T COMMENT THIS OUT (default val is true, need this so that hidden nodes are included in search for node hit with hittest)
            hitTestOptions[SCNHitTestOption.searchMode] = 1 // search mode follows old behaviour (apparently better?) not actually sure this helps
            let cgTarget = CGPoint(x:CGFloat(targetPosition.x), y: CGFloat(targetPosition.y))
            let hitResultsOther: [SCNHitTestResult]  = sceneView.hitTest(cgTarget , options: hitTestOptions)
            if let hit = hitResultsOther.first {
                print(hit.node.name)
                if (!(hit.node.name == nil)){ // if a valid node has been hit, mark the start point and set target as locked so that line can be drawn from candle to target
                    targetLocked = true;
                    print (targetPosition) // which is the point of view when object is tapped
                    target = targetPosition
                } else {
                    showUserInstruction(instruction: "Pedicle not selected,\n    Try again", xVal: -0.55) // if "nil" object selected, let the user try again
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { // let text show up a few seconds, then remove
                        self.textNode.removeFromParentNode()
                    }
                }
            }
            /*
            // let line = SCNGeometry.lineFrom(vector: targetPosition, toVector: self.sceneView.pointOfView!)
            let line = SCNGeometry.lineFrom(vector: targetPosition, toVector: SCNVector3(1,1,1)) //create a line between 2 given SCNVector3 points, need to anchor to both camera and given point
            let lineNode = SCNNode(geometry: line)
            lineNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
            sceneView.pointOfView?.addChildNode(lineNode) // add as a child node to the camera's point of view
 */
            
            // if comparing touch location to pedical location; not necessary atm
           // let hitResults: [SCNHitTestResult]  = sceneView.hitTest(location, options: hitTestOptions)
            // check if the location the target was = a pedical
        }
        if (targetLocked && !trajectoryExists){
            showUserInstruction(instruction: "Select Trajectory Angle", xVal: -0.62) // user should now select trajectory angle by positioning camera
            //print (target)
            trajectoryExists = true;
            drawTrajectory(targetPosition: target);
            //showUserInstruction(instruction: "new start point + trajectory", xVal: -0.62)
            //print("new start point + trajectory")
            targetLocked = false; // allow to re-select trajectory
            trajectoryExists = false; // allow to re-select
        }
        
    }
    
    func createSpine(position : SCNVector3){
        nodeModel =  spine.rootNode.childNode( withName: nodeName, recursively: true)// recursively binds child node to root
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

func normalizeVector(_ iv: SCNVector3) -> SCNVector3 {
    let length = sqrt(iv.x * iv.x + iv.y * iv.y + iv.z * iv.z)
    if length == 0 {
        return SCNVector3(0.0, 0.0, 0.0)
    }
    
    return SCNVector3( iv.x / length, iv.y / length, iv.z / length)
    
}

extension SCNGeometry {
    class func lineFrom(fromVector vector1: SCNVector3, toVector vector2: SCNVector3) -> SCNGeometry {
        let indices: [Int32] = [0, 1]
        let source = SCNGeometrySource(vertices: [vector1, vector2])
        let element = SCNGeometryElement(indices: indices, primitiveType: .line)
        return SCNGeometry(sources: [source], elements: [element])
        
    }
}

extension SCNNode {
    
    func cylinderLine(fromstartPoint: SCNVector3,
                                          toendPoint: SCNVector3,
                                          radius: CGFloat,
                                          color: UIColor) -> SCNNode {
        let w = SCNVector3(x: toendPoint.x-fromstartPoint.x,
                           y: toendPoint.y-fromstartPoint.y,
                           z: toendPoint.z-fromstartPoint.z)
        let l = CGFloat(sqrt(w.x * w.x + w.y * w.y + w.z * w.z))
        
        if l == 0.0 {
            // two points together.
            let sphere = SCNSphere(radius: radius)
            sphere.firstMaterial?.diffuse.contents = color
            self.geometry = sphere
            self.position = fromstartPoint
            return self
            
        }
        
        let cyl = SCNCylinder(radius: radius, height: l)
        cyl.firstMaterial?.diffuse.contents = color
        
        self.geometry = cyl
        
        //original vector of cylinder above 0,0,0
        let ov = SCNVector3(0, l/2.0,0)
        //target vector, in new coordination
        let nv = SCNVector3((toendPoint.x - fromstartPoint.x)/2.0, (toendPoint.y - fromstartPoint.y)/2.0,
                            (toendPoint.z-fromstartPoint.z)/2.0)
        
        // axis between two vector
        let av = SCNVector3( (ov.x + nv.x)/2.0, (ov.y+nv.y)/2.0, (ov.z+nv.z)/2.0)
        
        //normalized axis vector
        let av_normalized = normalizeVector(av)
        let q0 = Float(0.0) //cos(angel/2), angle is always 180 or M_PI
        let q1 = Float(av_normalized.x) // x' * sin(angle/2)
        let q2 = Float(av_normalized.y) // y' * sin(angle/2)
        let q3 = Float(av_normalized.z) // z' * sin(angle/2)
        
        let r_m11 = q0 * q0 + q1 * q1 - q2 * q2 - q3 * q3
        let r_m12 = 2 * q1 * q2 + 2 * q0 * q3
        let r_m13 = 2 * q1 * q3 - 2 * q0 * q2
        let r_m21 = 2 * q1 * q2 - 2 * q0 * q3
        let r_m22 = q0 * q0 - q1 * q1 + q2 * q2 - q3 * q3
        let r_m23 = 2 * q2 * q3 + 2 * q0 * q1
        let r_m31 = 2 * q1 * q3 + 2 * q0 * q2
        let r_m32 = 2 * q2 * q3 - 2 * q0 * q1
        let r_m33 = q0 * q0 - q1 * q1 - q2 * q2 + q3 * q3
        
        self.transform.m11 = r_m11
        self.transform.m12 = r_m12
        self.transform.m13 = r_m13
        self.transform.m14 = 0.0
        
        self.transform.m21 = r_m21
        self.transform.m22 = r_m22
        self.transform.m23 = r_m23
        self.transform.m24 = 0.0
        
        self.transform.m31 = r_m31
        self.transform.m32 = r_m32
        self.transform.m33 = r_m33
        self.transform.m34 = 0.0
        
        self.transform.m41 = (fromstartPoint.x + toendPoint.x) / 2.0
        self.transform.m42 = (fromstartPoint.y + toendPoint.y) / 2.0
        self.transform.m43 = (fromstartPoint.z + toendPoint.z) / 2.0
        self.transform.m44 = 1.0
        return self
    }
}
