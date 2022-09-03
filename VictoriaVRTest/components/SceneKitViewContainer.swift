//
//  SceneKitViewContainer.swift
//  VictoriaVRTest
//
//  Created by George Ivannikov on 03.09.2022.
//

import RealityKit
import SceneKit
import SwiftUI

struct SceneKitViewContainer: UIViewRepresentable, SCNViewCreator {
    let arModel: ARModel?
    
    func makeUIView(context: Context) -> SCNView {
        createSCNView()
    }
    func updateUIView(_ uiView: SCNView, context: Context) {}
}
