//
//  SCNViewCreator.swift
//  VictoriaVRTest
//
//  Created by George Ivannikov on 03.09.2022.
//

import RealityKit
import Combine
import SceneKit
import SwiftUI

protocol SCNViewCreator {
    var arModel: ARModel? { get }
}

extension SCNViewCreator {
    func createSCNView() -> SCNView {
        let scnView = SCNView(frame: .zero)
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
        
        if let arModel = arModel {
            scnView.scene = SCNScene(named: arModel.fileName)
            let model = scnView.scene?.rootNode.childNode(withName: arModel.node,
                                                         recursively: true)
            model?.geometry?.firstMaterial?.diffuse.contents = UIImage(named: arModel.textures.first ?? "")
        }

        return scnView
    }
}
