//
//  InfoModel.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 19/4/24.
//

import Foundation

struct InfoModel {
    let count: Int
    let pages: Int
    let next: String
    
    init(dto: InfoDTO?) {
        self.count = dto?.count ?? 0
        self.pages = dto?.pages ?? 0
        self.next = dto?.next ?? ""
    }
}
