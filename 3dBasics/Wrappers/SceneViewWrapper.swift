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
        
        let torus = createTorus()
        view.scene?.rootNode.addChildNode(torus)
        
        let action = SCNAction.rotate(by: 90 * (CGFloat.pi/180.0), around: SCNVector3(x: 1, y: 0, z: 0), duration: 3)
        
        torus.runAction(action)
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
    
    func updateUIView(_ uiView: SCNView, context: Context) {
    }
}

#Preview {
    SceneViewWrapper()
}
