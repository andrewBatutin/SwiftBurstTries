//
//  AccessTrie.swift
//  BST_FP
//
//  Created by Batutin, Andriy on 10/14/14.
//  Copyright (c) 2014 Batutin, Andriy. All rights reserved.
//

import Foundation

enum AccessTrieElement<T>{
    case Empty
    case BSTElement(BST<T>)
    case AccessTrie(Array<AccessTrieElement>)
}

let trie:Array<AccessTrieElement<Character>> = [AccessTrieElement](count: 27, repeatedValue: AccessTrieElement.Empty)

func printAccessTrie<T>(trie:Array<AccessTrieElement<T>>) -> String{
    var res = ""
    for elem in trie{
        switch elem{
        case AccessTrieElement.Empty:
            res += "Empty; "
        case let AccessTrieElement.BSTElement(x):
            res += "BST Elem \(x); "
        case let AccessTrieElement.AccessTrie(x):
            res += "|Array " + printAccessTrie(x) + ";|"
        default:
            res += "Some Shit; "
        }
    }
    return res
}
    


