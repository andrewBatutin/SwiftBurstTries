//
//  AlphabetMap.swift
//  BST_FP
//
//  Created by Batutin, Andriy on 10/15/14.
//  Copyright (c) 2014 Batutin, Andriy. All rights reserved.
//

import Foundation

//A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
let alphabet:[Character:Int] = ["A" :1, "B":2, "C":3, "D":4, "E":5, "F":6, "G":7, "H":8, "I":9, "J":10, "K":11, "L":12, "M":13, "N":14, "O":15, "P":16, "Q":17, "R":18, "S":19, "T":20, "U":21, "V":22, "W":23, "X":24, "Y":25, "Z":26]

func letterIndex(letter:Character) -> Int{
    if  alphabet[letter] == nil{
        return -1
    }else{
        return alphabet[letter]!
    }
}