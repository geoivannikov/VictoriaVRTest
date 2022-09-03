//
//  ARModel.swift
//  VictoriaVRTest
//
//  Created by George Ivannikov on 03.09.2022.
//

import Foundation

struct ARModel: Hashable {
    let fileName: String
    let node: String
    let textures: [String]
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
