// MolecularViewerApp.swift
//负责应用程序的入口和配置。
import SwiftUI

@main
struct MolecularViewerApp: App {
    var body: some Scene {
        #if os(visionOS)
        WindowGroup {
            MolecularViewerView()
        }
        .windowStyle(.volumetric)
        .windowResizability(.contentSize)
        #endif
    }
}
