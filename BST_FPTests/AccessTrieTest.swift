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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
