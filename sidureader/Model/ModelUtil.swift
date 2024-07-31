//
//  ModelUtil.swift
//  sidureader
//
//  Created by Armstrong Liu on 21/07/2024.
//

import Foundation
import UIKit

class ModelUtil {
    static let shared = ModelUtil()
    
    // Load from asset
    func load<T: Decodable>(assetname: String) -> T {
        guard let jsonData = NSDataAsset(name: assetname)?.data else {
            fatalError("Couldn't find \"\(assetname)\" in assets")
        }
                
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: jsonData)
        } catch {
            fatalError("Couldn't parse \"\(assetname)\" as \(T.self):\n\(error)")
        }
    }
    
    // Load from json file
    func load<T: Decodable>(filename: String) -> T {
        let data: Data
        
        guard let fileUrl = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle")
        }
        
        do {
            data = try Data(contentsOf: fileUrl)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}

