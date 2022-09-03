//
//  SceneKitViewContainer.swift
//  VictoriaVRTest
//
//  Created by George Ivannikov on 03.09.2022.
//

import RealityKit
import Combine
import SceneKit
import SwiftUI

struct SceneKitViewContainer: UIViewRepresentable, SCNViewCreator {
    let arModel: ARModel?
    @Binding var texture: String?
    
    func makeUIView(context: Context) -> SCNView {
        createSCNView()
    }
    func updateUIView(_ uiView: SCNView, context: Context) {
        if let arModel = arModel,
            let texture = texture {
            let model = uiView.scene?.rootNode.childNode(withName: arModel.node,
                                                         recursively: true)
            model?.geometry?.firstMaterial?.diffuse.contents = UIImage(named: texture)
        }
    }
}
