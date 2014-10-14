//
//  AccessTrie.swift
//  BST_FP
//
//  Created by Batutin, Andriy on 10/14/14.
//  Copyright (c) 2014 Batutin, Andriy. All rights reserved.
//

import Foundation

enum AccessTrie<T> {
    case TrieBST(BST<T>)
    case TrieAT(AccessTrieCol<T>)
}

enum AccessTrieCol<T>{
    case ATC([AccessTrie<T>])
}


func empty<T>() -> AccessTrieCol<T>{
    return AccessTrieCol.ATC([])
}

func append<T>(value : AccessTrie<T>, col: AccessTrieCol<T>) -> AccessTrieCol<T>{
    switch col{
    case var AccessTrieCol.ATC( x ):
        x.append(value)
        return AccessTrieCol.ATC(x)
    default:
        assert(false, "The impossible occurred")
    }
}