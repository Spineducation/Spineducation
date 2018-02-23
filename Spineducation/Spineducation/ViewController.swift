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
    var screwModel:SCNNode!
    var targetModel:SCNNode!
    var bullseyeNode:SCNNode!
    var clickSpineNode:SCNNode!
    
    let textNode = SCNNode()
    let nodeName = "l4_Default" // Same name we set for the node on SceneKit's editor
    var targetExists = false;
    var reposition = false;
    var pedicle = false;
    var targetLocked = false;
    var trajectoryLocked = false;
    var target = SCNVector3();
    var trajectoryExists = false;
    var startNode: SCNNode?
    var lineNode: SCNNode?
    
    var sphereNode: SCNNode?
    var clickPosition = SCNVector3();
    
   // clickSpine.materials = [clickMaterial]
    
    let bullseyeImage = UIImage(named: "bullseye.png")?.withRenderingMode(.alwaysOriginal)
    
    
    @IBAction func Menu(_ sender: Any) {
       // print("click")
    }
    let spine = SCNScene(named: "art.scnassets/spine-collection-of-thunthu/4cylinders.dae")! // sets the spine to spine 3d image file
    
    let screw = SCNScene(named: "art.scnassets/screw.dae")! // sets the screw to screw dae file
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        self.sceneView.autoenablesDefaultLighting = true // instead of lamps in the spine image file, this just allows the scene itself to auto-light
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        // makes edges smooth
        sceneView.antialiasingMode = .multisampling4X
        
        let scene = SCNScene()
        
        nodeModel =  scene.rootNode.childNode(withName: nodeName, recursively: true)
        
        sceneView.scene.rootNode.addChildNode(spine.rootNode)
        
        self.sceneView.autoenablesDefaultLighting = true
       // self.sceneView.antialiasingMode = .multisampling4X
        
        // Set the scene to the view
        sceneView.scene = scene
        
       
        
        showUserInstruction(instruction: "Tap to add spine", xVal: -0.425)
      }
    
    // add the target to the screen
    func showTarget(){
        let bullseyeNode = make2dNode(image: bullseyeImage!, width: CGFloat(0.001), height: CGFloat(0.001)) // use width and height to adjust size of bullseye
        
        // create bullseye node extremely close to camera so that user can view and target pedacles close up
        bullseyeNode.position = SCNVector3Make(0, 0, -0.01)
        
        sceneView.pointOfView?.addChildNode(bullseyeNode) // add the bullseyeNode as a child of the point of view (camera) so that image moves with camera
    }
    func showUserInstruction (instruction: String, xVal: Float){
    /*    if ((instruction == "Reposition as needed" && reposition) || (instruction == "Tap pedicle start point" && pedicle)){ // doesn't allow the textnode for instructions that have already occurred to be re-positioned, seems to fix the problem of moving instructions around screen when user repositions spine
            return;
        }*/
            let clickSpine = SCNText (string: instruction, extrusionDepth: 1)
            let clickMaterial = SCNMaterial()
            
            clickMaterial.diffuse.contents = UIColor.white
            clickSpine.materials = [clickMaterial]
            let cameraPos = self.sceneView.pointOfView!.position
            textNode.position = SCNVector3(cameraPos.x + xVal, cameraPos.y-0.5, cameraPos.z - 2);
            textNode.scale = SCNVector3Make(0.01, 0.01, 0.01)
            textNode.geometry = clickSpine
            textNode.geometry?.firstMaterial?.diffuse.contents  = UIColor.white
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
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal; // makes plane show up underneith detecting surfaces
        
        // Run the view's session
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // new stuff from tutorial
    func doHitTestOnExistingPlanes() -> SCNVector3? {
        let results = sceneView.hitTest(view.center, types: .existingPlaneUsingExtent)
        if let result = results.first{
            let hitPos = self.positionFromTransform(result.worldTransform)
            return hitPos        }
        return nil
    }
    
    func positionFromTransform(_ transform: matrix_float4x4) -> SCNVector3 {
        return SCNVector3Make(transform.columns.3.x, transform.columns.3.y,transform.columns.3.z)
        
    }
    
    func nodeWithPosition(_ position: SCNVector3) -> SCNNode { // starting position from touch
        //create sphere geometry with radius
        let sphere = SCNSphere(radius: 0.003)
        sphere.firstMaterial?.diffuse.contents = UIColor(red: 255/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1)
        sphere.firstMaterial?.lightingModel = .constant
        sphere.firstMaterial?.isDoubleSided = true
        let node = SCNNode(geometry: sphere)
        node.position = position
        return node
    }
    // new stuff from tutorial
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent? ) {
      //  var targetPosition: SCNVector3
        let location = touches.first!.location(in: sceneView)
        
         if (!targetExists){ // if the target does not exist, spine can and should still be able to be repositioned
            createSpine(position: SCNVector3Make(1,1,-0.65)) // create the spine
            textNode.removeFromParentNode() // remove instruction text asking user to tap to create spine
            /*
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
            }*/
            // for testing, enabled targetExists = true here, later uncomment block of code above
            showTarget();
            targetExists = true;
        }
        if (targetExists && !targetLocked){
            let tapLocation = self.sceneView.center // Get the center point, of the SceneView.
            let hitTestResults = sceneView.hitTest(tapLocation, types:.featurePoint)
            
            var hitTestOptions = [SCNHitTestOption: Any]()
            hitTestOptions[SCNHitTestOption.clipToZRange] = true // hit-testing searches only objects between the zNear and zFar distances of the pointOfView camera
      
            hitTestOptions[SCNHitTestOption.boundingBoxOnly] = true // optimize search performance, but geometric accuracy suffers
            hitTestOptions[SCNHitTestOption.ignoreHiddenNodes] = false // DON'T COMMENT THIS OUT (default val is true, need this so that hidden nodes are included in search for node hit with hittest)
            hitTestOptions[SCNHitTestOption.searchMode] = 1 // search mode follows old behaviour (apparently better?) not actually sure this helps

           // Get the location of the target in Vector3 coordinates
            let targetPosition = sceneView.projectPoint(self.sceneView.pointOfView!.position)
       
            // Convert the SCNVector3 Point to a CGPoint to compare for hittest
            let cgTarget = CGPoint(x:CGFloat(targetPosition.x), y: CGFloat(targetPosition.y))
            let hitResultsOther: [SCNHitTestResult]  = sceneView.hitTest(cgTarget , options: hitTestOptions)
            
            // get location of hit in AR plane
            let hitResults = sceneView.hitTest(location, types: .existingPlaneUsingExtent)
            /*if let result: ARHitTestResult = hitResults.first {
                
                //target = SCNVector3Make(result.worldTransform.columns.3.x, result.worldTransform.columns.3.y, result.worldTransform.columns.3.z)
            }*/
            

            // check if a pedical was hit
            if let hit = hitResultsOther.first { // hit test  for spine model
                let startpoint = hit.worldCoordinates
                
        //        print(hit.node.name)
                if (!(hit.node.name == nil)){ // if a valid node has been hit, mark the start point and set target as locked so that line can be drawn from candle to target
                    targetLocked = true;
                    let printStatement = "You have hit " + hit.node.name! // this finishes our capstone pls don't delete or we cri
                //    print("hit node pos ",hit.node.position) // this finishes our capstone pls don't delete or we cri
                    print("node hit is " + hit.node.name!)
                    showUserInstruction(instruction:  printStatement, xVal: -0.6)
                  //  targetLocked = false;
                    
                    if let result = hitTestResults.first { // hit test for sphere
                        let matrix = result.worldTransform
                        let column = matrix.columns.3
                        let position = SCNVector3(column.x,column.y,column.z)
                        let sphere = SCNSphere(radius: 0.01)
                        sphereNode = SCNNode(geometry: sphere)
                        targetLocked = true;
                        /*let positionY =  (hit.node.position.y + column.y)/2
                        let positionZ =  (hit.node.position.z + column.z)/2
                        let positionX = (hit.node.position.x + column.x)/2*/
                       // sphereNode.position = SCNVector3(hit.node.position.x, hit.node.position.y, hit.node.position.z - 0.6) //this was actually not bad
                        sphereNode?.position = startpoint
                        startNode = sphereNode;
                        sceneView.scene.rootNode.addChildNode((startNode)!)
                        clickPosition = startpoint;
                        
                        
                        
                        //tried to do this with anchor
                        /*let anchor = ARAnchor(transform:)
                        sceneView.session.add(anchor:anchor)*/
                        
                        //tried to do this with transform
                        //sphereNode.transform = hit.node.transform
                        
                       // sphereNode.position = SCNVector3Make(0, 0, -0.65)
                        //sphereNode.position = SCNVector3(positionX, positionY ,positionZ)
                        
                        
                        /*startNode = sphereNode;
                        sceneView.scene.rootNode.addChildNode((startNode)!)*/
                    
                        // spine root node position way too high
                        // spherenode position slightly too low
                        
                        
                        //print( "spine and sphere", positionZ)
                        /*startNode?.position = sphereNode.position
                        let sphereNode2 = SCNNode(geometry: sphere, color:.red)
                        sceneView.scene.rootNode.addChildNode(sphereNode2)*/
                        
                        
                         //startNode?.position = SCNVector3(sphereNode.position.x, positionY, positionZ)
                        
                    }
                } else { // if no spine object hit on 3d image
                    showUserInstruction(instruction: "Pedicle not selected,\n    Try again", xVal: -0.55) // if "nil" object selected, let the user try again
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { // let text show up a few seconds, then remove
                        self.textNode.removeFromParentNode()
                    }
                }
            }

            // check if the location the target was = a pedical
        }
        // get angle of trajectory on click
        else if (targetLocked && !trajectoryExists){
            showUserInstruction(instruction: "Select Trajectory Angle", xVal: -0.62) // user should now select trajectory angle by positioning camera
            
            // remove the trajectory line and node
            sphereNode!.removeFromParentNode()
            startNode!.removeFromParentNode()
            // create the screw object
            createScrew(position: clickPosition);
            
            trajectoryExists = true;
            trajectoryLocked = true;
            
            
          //  targetLocked = false; // allow to re-select trajectory
           // trajectoryExists = false; // allow to re-select
        }
        
    }

    
    func createSpine(position : SCNVector3){
        nodeModel =  spine.rootNode.childNode( withName: nodeName, recursively: true)// recursively binds child node to root
        let camera = self.sceneView.pointOfView!
        spine.rootNode.position = camera.convertPosition(position, to: nil)
        spine.rootNode.rotation = camera.rotation
        sceneView.scene.rootNode.addChildNode(spine.rootNode) // add this to the scene
    }
    
    func createScrew(position : SCNVector3){
        let camera = self.sceneView.pointOfView!
        screwModel =  screw.rootNode.childNode( withName: nodeName, recursively: true)// recursively binds child node to root
        screw.rootNode.position = position
        
        let angle = camera.rotation.w // + 90;//+ Float(Double.pi + Double.pi/2);
        print("The angle is",angle)
        screw.rootNode.rotation = SCNVector4(screw.rootNode.rotation.x, camera.rotation.y, screw.rootNode.rotation.z, angle);
        
        screw.rootNode.eulerAngles = camera.eulerAngles;    //    screw.rootNode.rotation = camera.rotation
      //  screw.rootNode.orientation = camera.orientation
        sceneView.scene.rootNode.addChildNode(screw.rootNode) // add this to the scene
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    

    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        print("Camera State: \(camera.trackingState)") // when camera state is normal, this means we're ready to AR
        // could not let user do anything up until tracking state is set to normal? try this iin touchesBegan
        //can't seem to find a way to actually get the string of this value for comparison? .normal is a case, so won't let me compare camera.trackingState == "normal" or camera.trackingState == ".normal" but why does it print like a string then? smh

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
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval){
        DispatchQueue.main.async{
            guard let currentPosition = self.doHitTestOnExistingPlanes(),
                let start = self.startNode else {
                    return
            }
            self.lineNode?.removeFromParentNode() // remove old line, so that every update appears to allow the original line to move (instead of creating x new ones)
            
            if (!self.trajectoryExists){
                let cylinderNode = SCNNode() // scnnode for cylinder
                self.lineNode = cylinderNode.cylinderLine(fromstartPoint: currentPosition, toendPoint: start.position, radius: 0.001, color: .orange) // create cylinder line from currentposition and start position
                self.sceneView.scene.rootNode.addChildNode(self.lineNode!) // add the line to the scene
            }
        }
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
        plane.width = CGFloat(planeAnchor.extent.x )
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
