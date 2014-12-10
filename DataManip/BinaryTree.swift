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
    
    func prettyPrint() {
        switch(self.data, self.left, self.right) {
        case let (.Some(data), .Some(l), .Some(r)):
            println("--\(data)\n")
            l.prettyPrint()
            r.prettyPrint()
        case let (.Some(data), .Some(l), .None):
            println("--\(data)\n")
            l.prettyPrint()
        case let (.Some(data), .None, .Some(r)):
            println("--\(data)\n")
            r.prettyPrint()
        case let (.Some(data), .None, .None):
            println("--\(data)\n  |-- /-\n  '-- /-\n")
        case let (.None, .None, .None):
            println("None!")
        default:
            assertionFailure("should not get here")
        }

    }
}