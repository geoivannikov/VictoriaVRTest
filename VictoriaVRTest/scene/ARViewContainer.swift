//
//  ARViewContainer.swift
//  VictoriaVRTest
//
//  Created by George Ivannikov on 03.09.2022.
//

import RealityKit
import Combine
import SceneKit
import SwiftUI

struct ARViewContainer: UIViewRepresentable {
    let model: ARModel?
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView()
        
        guard let model = model,
              let modelEntity = try? ModelEntity.loadModel(named: model.fileName) else {
            return arView
        }
        
        if let texture = model.textures.first,
           let url = AssetExtractor.createLocalUrl(imageName: texture) {
            var material = SimpleMaterial()
            try? material.baseColor = .texture(.load(contentsOf: url))
            modelEntity.model?.materials = [material]
        }

        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(modelEntity)
        arView.scene.addAnchor(anchorEntity)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
