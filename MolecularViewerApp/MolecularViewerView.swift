// MolecularViewerView.swift
//负责主视图的实现，包括文件导入和3D模型显示。
import SwiftUI
import RealityKit

struct MolecularViewerView: View {
    @State private var model: ProteinFile?
    @State private var isFilePickerPresented = false
    @ObservedObject var modelManager = MolecularModelManager()
    
    var body: some View {
        #if os(visionOS)
        WindowGroup {
            VStack {
                // 文件导入按钮
                Button("导入文件") {
                    isFilePickerPresented = true
                }
                
                if let model = modelManager.currentModel {
                    // 3D模型显示
                    MolecularModelView(model: model)
                }
            }
            .fileImporter(
                isPresented: $isFilePickerPresented,
                allowedContentTypes: [.pdb, .xyz],
                allowsMultipleSelection: false
            ) { result in
                // 处理文件导入
                handleFileImport(result)
            }
        }
        .windowStyle(.volumetric)
        #endif
    }
    
    private func handleFileImport(_ result: Result<[URL], Error>) {
        switch result {
        case .success(let urls):
            guard let url = urls.first else { return }
            Task {
                do {
                    let fileText = try await FileHandler().loadFile(from: url)
                    if url.pathExtension.lowercased() == "pdb" {
                        try await modelManager.loadPDBFile(fileText)
                    } else if url.pathExtension.lowercased() == "xyz" {
                        try modelManager.loadXYZFile(fileText)
                    }
                } catch {
                    print("文件加载错误: \(error)")
                }
            }
        case .failure(let error):
            print("文件导入失败: \(error)")
        }
    }
}
