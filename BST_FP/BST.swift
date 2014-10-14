//
//  BST.swift
//  BST_FP
//
//  Created by Batutin, Andriy on 10/13/14.
//  Copyright (c) 2014 Batutin, Andriy. All rights reserved.
//

import Foundation

enum BST<T> :BurstTrie{
    case Leaf
    case Node(Box<BST<T>>, Box<T>, Box<BST<T>>)
}

func add<T:Comparable>(value:T, tree:BST<T>) -> BST<T>{
    switch tree{
    case BST.Leaf:
        NSLog("leaf \(value)")
        return BST.Node(Box(BST.Leaf), Box(value), Box(BST.Leaf))
    case let BST.Node(left, x, right) where value == x.unbox:
        NSLog("value == x.unbox \(value)")
        return tree
    case let BST.Node(left, x, right) where value > x.unbox:
        NSLog("value > x.unbox v = \(value) x = \(x.unbox)")
        return BST.Node(left, x, Box(add(value, right.unbox)))
    case let BST.Node(left, x, right) where value < x.unbox:
        NSLog("value < x.unbox v = \(value) x = \(x.unbox)")
        return BST.Node(Box(add(value, left.unbox)), x, right)
    default:
        assert(false, "The impossible occurred")
    }
}

func preatyPrint<T>(tree: BST<T>, var pad:String) -> String{
    switch tree {
    case let BST.Leaf:
        pad = "    " + pad
        return "\n" + pad + "|_@"
    case let BST.Node(left, x, right):
        pad = "    " + pad
        let res = "\n" + pad + "|_\(x.unbox) " + preatyPrint(left.unbox, pad) + preatyPrint(right.unbox, pad)
        return res
    }
}

func elements<T>(tree: BST<T>) -> [T] {
    switch tree {
    case let BST.Leaf:
        return []
    case let BST.Node(left, x, right):
        return elements(left.unbox) + [x.unbox] + elements(right.unbox)
    }
}

