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
    
    func prettyPrint() -> [String]{
        switch(self.data, self.left, self.right) {
        case let (.Some(data), .Some(l), .Some(r)):
            let res = ["--\(data)\n"] +
            l.prettyPrint().map({"  |\n  |" + $0}) +
            r.prettyPrint().map({"  |\n  |" + $0})
            return res
        case let (.Some(data), .Some(l), .None):
            let res = ["--\(data)\n"] +
            l.prettyPrint().map({"  |\n  |" + $0})
        case let (.Some(data), .None, .Some(r)):
            let res = ["--\(data)\n"] +
            r.prettyPrint().map({"  |\n  |" + $0})
        case let (.Some(data), .None, .None):
            let res = ["--\(data)\n      |-- /-\n      '-- /-\n"]
            return res
        case let (.None, .None, .None):
            return ["None!"]
        default:
            assertionFailure("should not get here")
            return [""]
        }
        return ["WTF"]
    }
    
    func leftLeafProcess(array:Array<String>)->Array<String>{
        if let (head,tail) = array.match {
            return ["  '" + head] + tail.map{"  " + $0}
        } else {
            return []
        }
    }

}