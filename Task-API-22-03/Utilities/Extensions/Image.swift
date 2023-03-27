//
//  Image.swift
//  Task-API-22-03
//
//  Created by Paras  on 23/03/23.
//

import Foundation
import SwiftUI

extension Image {
    
    func data(url:URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
