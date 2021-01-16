//
//  Array+Only.swift
//  Memorize
//
//  Created by Chris Chau on 2021/1/10.
//  Copyright © 2021 Chris Chau. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
