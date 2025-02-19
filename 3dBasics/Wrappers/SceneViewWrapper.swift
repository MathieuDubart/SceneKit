//
//  SceneViewWrapper.swift
//  3dBasics
//
//  Created by Mathieu Dubart on 19/02/2025.
//

import SceneKit
import SwiftUI

struct SceneViewWrapper: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        
        view.scene = SCNScene()
        view.allowsCameraControl = true
        
        view.backgroundColor = .black
        view.autoenablesDefaultLighting = true
        
        let geo = createText("salut mon brave")
        view.scene?.rootNode.addChildNode(geo)
        
        let action = SCNAction.rotate(by: 90 * (CGFloat.pi/180.0), around: SCNVector3(x: 1, y: 0, z: 0), duration: 3)
        
        let repeatAction = SCNAction.repeatForever(action)
        geo.runAction(repeatAction)
        
        
        // torus.removeFromParentNode() to remove it from node
        
        return view
    }
    
    func createTorus() -> SCNNode {
        let torus = SCNNode()
        torus.geometry = SCNTorus(ringRadius: 1, pipeRadius: 0.5)
        torus.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        torus.geometry?.firstMaterial?.specular.contents = UIColor.white
        
        return torus
    }
    
    func createBox() -> SCNNode {
        let box = SCNNode()
        box.geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.1)
        box.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        box.geometry?.firstMaterial?.specular.contents = UIColor.white
        return box
    }
    
    func createCapsule() -> SCNNode {
        let capsule = SCNNode()
        capsule.geometry = SCNCapsule(capRadius: 0.5, height: 1)
        capsule.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        capsule.geometry?.firstMaterial?.specular.contents = UIColor.white
        return capsule
    }
    
    func createSphere() -> SCNNode {
        let sphere = SCNNode()
        sphere.geometry = SCNSphere(radius: 1)
        sphere.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        sphere.geometry?.firstMaterial?.specular.contents = UIColor.white
        return sphere
    }
    
    func createCylinder() -> SCNNode {
        let cylinder = SCNNode()
        cylinder.geometry = SCNCylinder(radius: 0.5, height: 1)
        cylinder.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        cylinder.geometry?.firstMaterial?.specular.contents = UIColor.white
        return cylinder
    }
    
    func createConic() -> SCNNode {
        let conic = SCNNode()
        conic.geometry = SCNCone(topRadius: 0.5, bottomRadius: 0.5, height: 1)
        conic.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        conic.geometry?.firstMaterial?.specular.contents = UIColor.white
        return conic
    }
    
    func createPlane() -> SCNNode {
        let plane = SCNNode()
        plane.geometry = SCNPlane(width: 3, height: 3)
        plane.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        plane.geometry?.firstMaterial?.isDoubleSided = true
        
        return plane
    }
    
    func createPyramid() -> SCNNode {
        let pyramid = SCNNode()
        pyramid.geometry = SCNPyramid(width: 1, height: 1, length: 1)
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        return pyramid
    }
    
    func createShape() -> SCNNode {
        let shape = SCNNode()
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 2, height: 2))
        shape.geometry = SCNShape(path: path, extrusionDepth: 1)
        shape.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        return shape
    }
    
    func createTube() -> SCNNode {
        let tube = SCNNode()
        tube.geometry = SCNTube(innerRadius: 1, outerRadius: 2, height: 5)
        tube.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        return tube
    }
    
    func createText(_ str: String) -> SCNNode {
        let text = SCNNode()
        text.geometry = SCNText(string: str, extrusionDepth: 1)
        text.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        text.geometry?.firstMaterial?.specular.contents = UIColor.green
        
        return text
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
    }
}

#Preview {
    SceneViewWrapper()
}
