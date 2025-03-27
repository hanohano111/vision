// MolecularModelManager.swift
//负责管理分子模型的加载和管理。
import Foundation

class MolecularModelManager: ObservableObject {
    @Published var currentModel: ProteinFile?
    
    func loadPDBFile(_ text: String) async throws {
        let parser = PDBParser()
        currentModel = try await parser.parsePDB(
            fileName: "model",
            fileExtension: "pdb",
            byteSize: nil,
            rawText: text,
            progress: Progress()
        )
    }
    
    func loadXYZFile(_ text: String) throws {
        let parser = XYZParser()
        currentModel = try parser.parseXYZ(
            fileName: "model",
            fileExtension: "xyz",
            byteSize: nil,
            rawText: text,
            progress: Progress()
        )
    }
}
