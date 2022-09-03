//
//  ARModel.swift
//  VictoriaVRTest
//
//  Created by George Ivannikov on 03.09.2022.
//

import Foundation

struct ARModel {
    let fileName: String
    let node: String
    let textures: [String] // If I understand the task correctly, an object can have multiple textures
}

extension ARModel {
    init?(model: ARModel?, texture: String?) {
        if let model = model,
           let texture = texture {
            self.init(fileName: model.fileName,
                      node: model.node,
                      textures: [texture])
        } else {
            return nil
        }
    }
}

extension ARModel: Hashable { }
