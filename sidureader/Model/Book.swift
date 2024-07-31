//
//  Book.swift
//  sidureader
//
//  Created by Armstrong Liu on 20/07/2024.
//

import Foundation
import SwiftUI

struct Book: Codable, Identifiable {
    var id = UUID()
    var bookName: String?
    var authors: [String]?
    var categories: [String]?
    var thumbnailPath: String?
    var thumbnailUrl: String?
}
