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
        
        let torus = SCNNode()
        torus.geometry = SCNTorus(ringRadius: 1, pipeRadius: 0.5)
        torus.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        torus.geometry?.firstMaterial?.specular.contents = UIColor.white
        
        view.scene?.rootNode.addChildNode(torus)
        
        // torus.removeFromParentNode() to rmeove it from node
        return view
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
    }
}
#Preview {
    SceneViewWrapper()
}
