//
//  Box.swift
//  BST_FP
//
//  Created by Batutin, Andriy on 10/13/14.
//  Copyright (c) 2014 Batutin, Andriy. All rights reserved.
//

import Foundation

class Box<T>  {
    let unbox: T
    init(_ value: T) { self.unbox = value }
}
func all<T> (xs : [T], predicate : T -> Bool) -> Bool {
    for x in xs {
        if !predicate(x) {
            return false
        }
    }
    return true
}