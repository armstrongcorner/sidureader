//
//  BookTest.swift
//  sidureader
//
//  Created by Armstrong Liu on 21/07/2024.
//

import Foundation
import SwiftUI

struct BookTest: Codable, Identifiable {
    var id: String?
    var title: String?
    var content: String?
}

@Observable
class BookTestData {
    var books: [BookTest] = ModelUtil.shared.load(assetname: "books")
}
