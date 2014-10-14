//
//  BSTTest.swift
//  BST_FP
//
//  Created by Batutin, Andriy on 10/13/14.
//  Copyright (c) 2014 Batutin, Andriy. All rights reserved.
//

import UIKit
import XCTest

class BSTTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBSTInt() {
        let tree:BST<Int> = BST.Leaf
        //[8, 2, 10, 9, 11, 1, 7]
        var mutTree = add(8, tree)
        mutTree = add(2, mutTree)
        mutTree = add(10, mutTree)
        mutTree = add(9, mutTree)
        mutTree = add(11, mutTree)
        mutTree = add(1, mutTree)
        mutTree = add(7, mutTree)
        let x = preatyPrint( mutTree ,"")
        XCTAssert(false, "\(x)")
    }

    func testBSTString() {
        let tree:BST<Character> = BST.Leaf
        var mutTree = add("a", tree)
        mutTree = add("n", mutTree)
        mutTree = add("d", mutTree)
        mutTree = add("r", mutTree)
        mutTree = add("e", mutTree)
        mutTree = add("w", mutTree)
        mutTree = add("1", mutTree)
        let x = preatyPrint( mutTree ,"")
        XCTAssert(false, "\(x)")
    }
    
    func testStringComp(){
        XCTAssert("NT" < "RE", "yep")
        XCTAssert("re" < "st", "yep")
        XCTAssert("ME" < "R", "yep")
        XCTAssert("R" < "T", "yep")
        XCTAssert("T" < "VE", "yep")
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
