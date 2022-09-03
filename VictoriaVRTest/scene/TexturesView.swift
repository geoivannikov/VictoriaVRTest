//
//  TexturesView.swift
//  VictoriaVRTest
//
//  Created by George Ivannikov on 03.09.2022.
//

import SwiftUI

struct TexturesView: View {
    @Binding var arModel: ARModel?
    @State private var selectedTexture: String?
    @State private var isARVewActive = false

    var body: some View {
        VStack {
            SceneKitViewContainer(arModel: arModel, texture: $selectedTexture).ignoresSafeArea()
            Text("Pick a texture")
                .bold()
            HStack{
                ForEach((1...2)
                    .map { "texture\($0)" }, id: \.self) { fileName in
                        ZStack {
                            Image(uiImage: UIImage(named: "\(fileName).png")!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .layoutPriority(-1)
                                .onTapGesture {
                                    selectedTexture = "\(fileName).png"
                                    arModel = ARModel(fileName: arModel!.fileName,
                                                      node: arModel!.node,
                                                      textures: [selectedTexture ?? ""])
                                }
                            VStack {
                                Spacer()
                                Text("\(fileName)")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .background(Color.white)
                            }
                        }
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                        .border(Color.black)
                    }
            }
            Button(action: {
                isARVewActive = true
            }, label: {
                Text("Display")
                    .foregroundColor(.black)
                    .font(.title)
                    .padding()
                    .border(.black, width: 5)

            })
            .padding()
//            NavigationLink(destination: ARViewContainer(model: arModel), isActive: $isARVewActive) { }
        }
    }
}
