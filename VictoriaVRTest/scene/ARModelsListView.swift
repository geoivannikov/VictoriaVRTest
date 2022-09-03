//
//  ARModelsListView.swift
//  VictoriaVRTest
//
//  Created by George Ivannikov on 03.09.2022.
//

import SwiftUI

struct ARModelsListView: View {
    @State private var isTextureVewActive = false
    @State private var arModels: [ARModel] = {
        [ARModel(fileName: "object1.usdz", node: "ManBoots", texture: nil),
         ARModel(fileName: "object2.usdz", node: "MongolianSandals3", texture: nil),
         ARModel(fileName: "object3.usdz", node: "ArabicSandal2", texture: nil)]
    }()
    @State private var selectedARModel: ARModel?
    @State var selectedTexture: String?
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Pick a model")
                    .bold()
                ForEach(arModels, id: \.self) { arModel in
                        ZStack {
                            SceneKitViewContainer(arModel: arModel, texture: $selectedTexture).ignoresSafeArea()
                                .onTapGesture {
                                    isTextureVewActive = true
                                    selectedARModel = arModel
                                }
                            VStack {
                                Spacer()
                                Text(arModel.fileName)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .background(Color.white)
                            }
                        }
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                        .border(Color.black)
                    }
                NavigationLink(destination: TexturesView(arModel: $selectedARModel), isActive: $isTextureVewActive) { }
            }
            .onAppear {
                arModels = arModels
                    .compactMap { model in
                        model.fileName == selectedARModel?.fileName ? selectedARModel : model
                    }
            }
            .navigationTitle("AR models")
        }
    }
}

struct ARModelsListView_Previews: PreviewProvider {
    static var previews: some View {
        ARModelsListView()
    }
}

