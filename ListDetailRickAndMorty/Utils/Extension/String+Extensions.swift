//
//  String+Extensions.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 18/4/24.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
