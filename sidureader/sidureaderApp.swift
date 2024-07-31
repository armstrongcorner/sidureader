//
//  sidureaderApp.swift
//  sidureader
//
//  Created by Armstrong Liu on 20/07/2024.
//

import SwiftUI

@main
struct sidureaderApp: App {
    @State private var bookTestData = BookTestData()
    
    var body: some Scene {
        WindowGroup {
            BookListView()
                .environment(bookTestData)
        }
    }
}
