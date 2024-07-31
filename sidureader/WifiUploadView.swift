//
//  WifiUploadView.swift
//  sidureader
//
//  Created by Armstrong Liu on 29/07/2024.
//

import SwiftUI
import GCDWebServer

struct WifiUploadView: View {
    @State private var webServerUrl = ""
    @State private var webUploader = GCDWebUploader()
    
    var body: some View {
        Text("请从浏览器打开: \(webServerUrl)")
            .onAppear {
                webUploader = startWebUploader()
                print("Web uploader started")
            }
            .onDisappear {
                webUploader.stop()
                print("Web uploader stopped")
            }
    }
    
    private func startWebUploader() -> GCDWebUploader {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).map(\.path).first ?? ""
        let webUploader = GCDWebUploader(uploadDirectory: documentsPath)
        webUploader.start(withPort: 8080, bonjourName: "GCD Web Server")
        print("请从浏览器打开： \(webUploader.serverURL?.absoluteString ?? "")")
        print("书籍目录：\(documentsPath)")
        webServerUrl = webUploader.serverURL?.absoluteString ?? ""
        return webUploader
    }
}

#Preview {
    WifiUploadView()
}
