//
//  AssetExtractor.swift
//  VictoriaVRTest
//
//  Created by George Ivannikov on 03.09.2022.
//

import SwiftUI

class AssetExtractor {
    static func createLocalUrl(imageName: String, fileExtension: String = "png") -> URL? {
        let fileManager = FileManager.default
        let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let url = cacheDirectory.appendingPathComponent("\(imageName).\(fileExtension)")

        guard fileManager.fileExists(atPath: url.path) else {
            guard let image = UIImage(named: imageName),
                let data = image.pngData()
            else { return nil }

            fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
            return url
        }

        return url
    }
}
