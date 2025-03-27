// FileHandler.swift
//负责文件导入和读取的处理。
import Foundation

class FileHandler {
    func loadFile(from url: URL) async throws -> String {
        let data = try Data(contentsOf: url)
        return String(data: data, encoding: .utf8) ?? ""
    }
}
