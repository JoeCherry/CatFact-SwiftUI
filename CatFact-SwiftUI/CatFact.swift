//
//  CatFact.swift
//  CatFact-SwiftUI
//
//  Created by joe cherry on 6/4/19.
//  Copyright © 2019 joe cherry. All rights reserved.
//

import SwiftUI

struct CatFact: Hashable, Codable {
    var id: String
    let text: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case text
    }
}
