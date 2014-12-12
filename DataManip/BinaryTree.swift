//
//  BinaryTree.swift
//  DataManip
//
//  Created by Batutin, Andriy on 12/5/14.
//  Copyright (c) 2014 Batutin, Andriy. All rights reserved.
//

/*
pp :: Show a => Tree a -> IO ()
pp = (mapM_ putStrLn) . treeIndent
where
treeIndent Empty          = ["-- /-"]
treeIndent (Node v lb rb) =
["--" ++ (show v)] ++
map ("  |" ++) ls ++
("  `" ++ r) : map ("   " ++) rs
where
(r:rs) = treeIndent $ rb
ls     = treeIndent $ lb
*/

import Foundation

extension Array {
    var match : (head: T, tail: [T])? {
        return (count > 0) ? (self[0],Array(self[1..<count])) : nil
    }
    
}

class BinaryTree<T:Comparable> {
    var data: T?
    var left: BinaryTree<T>?
    var right: BinaryTree<T>?
    
    init (n: T) {
        self.data = n
    }
    
    func insert (n: T) {
        switch(self.data, self.left, self.right) {
        case let (.None, _, _):
            self.data = n
        case let (data, .Some(l), _) where data < n:
            l.insert(n)
        case let (data, .None, _) where data < n:
            self.left = BinaryTree(n:n)
        case let (data, _, .Some(r)) where data >= n:
            r.insert(n)
        case let (data, _, .None) where data >= n:
            self.right = BinaryTree(n:n)
        default:
            assertionFailure("should not get here")
        }
    }
    
    func printMeAllTheStuff(){
        prettyPrint(self).map{println($0)}
    }
    
}

func prettyPrint<T:Comparable>(tree:BinaryTree<T>) ->[String]{
    switch(tree.data, tree.left, tree.right) {
    case let (.Some(data), .Some(l), .Some(r)):
        var left = prettyPrint(l).map{"  |" + $0}
        var right = prettyPrint(r)
        let res = ["--\(data)"] + left + leftLeafProcess(right)
        return res
    case let (.Some(data), .Some(l), .None):
        var left = prettyPrint(l).map{"   |" + $0}
        let res = ["--\(data)"] + left + ["   '-- /-"]
        return res
    case let (.Some(data), .None, .Some(r)):
        var right = prettyPrint(r)
        var res = ["--\(data)"] + ["  |-- /-"] + leftLeafProcess(right)
        return res
    case let (.Some(data), .None, .None):
        var res = ["--\(data)"] + ["  |-- /-"] + ["  '-- /-"]
        return res
    case let (.None, .None, .None):
        return ["-- /-"]
    default:
        return ["Default!?"]
    }
}


func leftLeafProcess(array:[String])->[String]{
    if let (head,tail) = array.match {
        return ["  '" + head] + tail.map{"  " + $0}
    } else {
        return []
    }
}
