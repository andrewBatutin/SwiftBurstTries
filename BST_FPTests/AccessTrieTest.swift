//
//  AccessTrieTest.swift
//  BST_FP
//
//  Created by Batutin, Andriy on 10/14/14.
//  Copyright (c) 2014 Batutin, Andriy. All rights reserved.
//

import UIKit
import XCTest

class AccessTrieTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testEmpty(){
        var a:[AccessTrieElement<Character>] = trie
        a[0] = AccessTrieElement.BSTElement(BST.Leaf)
        var b:[AccessTrieElement<Character>] = trie
        b[5] = AccessTrieElement.BSTElement(BST.Node(Box(BST.Leaf), Box("A"), Box(BST.Leaf)))
        a[1] = AccessTrieElement.AccessTrie( b)
        XCTAssert(false, "\(printAccessTrie(a))")

    }
    
    func testConstructBurstTrie(){
        let tree:BST<String> = BST.Leaf
        var mutTree = add("RE", tree)
        mutTree = add("NT", mutTree)
        mutTree = add("ST", mutTree)

        let x = preatyPrint( mutTree ,"")
        
        var a:[AccessTrieElement<String>] = trieStr
        a[5] = AccessTrieElement.BSTElement(mutTree)
        
        var treeN = add("N", tree)
        var b:[AccessTrieElement<String>] = trieStr
        b[1] = AccessTrieElement.BSTElement(treeN)
        
        var c:[AccessTrieElement<String>] = trieStr
        c[25] = AccessTrieElement.AccessTrie(b)
        
        
        var treeC = add("R", tree)
        treeC = add("ME", treeC)
        treeC = add("T", treeC)
        treeC = add("VE", treeC)
        c[1] = AccessTrieElement.BSTElement(treeC)
        
        
        var top:[AccessTrieElement<String>] = trieStr
        top[23] = AccessTrieElement.AccessTrie(a)
        
        top[3] = AccessTrieElement.AccessTrie(c)
        
        XCTAssert(false, "\(printAccessTrie(top))")

    }
    
    func testCharMapping(){
        let a = letterIndex("A")
        XCTAssert(a == 1, "a is 1")
        let z = letterIndex("Z")
        XCTAssert(z == 26, "z is 26")
        let shit = letterIndex("!")
        XCTAssert(shit == -1, "shit is -1")

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
