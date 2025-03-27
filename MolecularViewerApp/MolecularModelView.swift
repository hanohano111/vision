// MolecularModelView.swift
//负责3D模型的显示。主程序入口。
import SwiftUI
import RealityKit

struct MolecularModelView: View {
    let model: ProteinFile
    
    var body: some View {
        #if os(visionOS)
        RealityView { content in
            // 创建3D模型
            let entity = createMolecularEntity(from: model)
            content.add(entity)
        }
        #endif
    }
    
    private func createMolecularEntity(from model: ProteinFile) -> Entity {
        let entity = ModelEntity()
        
        // 添加原子
        for atom in model.models[0].atoms {
            let sphere = ModelEntity(mesh: .sphere(radius: 0.1))
            sphere.position = atom
            entity.addChild(sphere)
        }
        
        return entity
    }
}
