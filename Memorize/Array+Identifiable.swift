//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Chris Chau on 2021/1/10.
//  Copyright © 2021 Chris Chau. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
