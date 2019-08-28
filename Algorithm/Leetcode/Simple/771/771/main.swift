//
//  main.swift
//  771
//
//  Created by Frank.Tian on 2019/8/28.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 771. 宝石与石头
 
 给定字符串J 代表石头中宝石的类型，和字符串 S代表你拥有的石头。 S 中每个字符代表了一种你拥有的石头的类型，你想知道你拥有的石头中有多少是宝石。
 
 J 中的字母不重复，J 和 S中的所有字符都是字母。字母区分大小写，因此"a"和"A"是不同类型的石头。
 
 示例 1:
 
 输入: J = "aA", S = "aAAbbbb"
 输出: 3
 示例 2:
 
 输入: J = "z", S = "ZZ"
 输出: 0
 注意:
 
 S 和 J 最多含有50个字母。
   J 中的字符不重复。

 */

// 执行用时 : 8 ms , 在所有 Swift 提交中击败了 97.37% 的用户
// 内存消耗 :20.4 MB , 在所有 Swift 提交中击败了 5.77%的用户
// Runtime: 8 ms, faster than 79.45% of Swift online submissions for Jewels and Stones.
// Memory Usage: 20.6 MB, less than 7.69% of Swift online submissions for Jewels and Stones.
class Solution1 {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        
        var r = 0
        for c in S {
            if J.contains(c) {
                r += 1
            }
        }
        return r
    }
}

// 执行用时 :4 ms , 在所有 Swift 提交中击败了 98.68% 的用户
// 内存消耗 : 20.3 MB , 在所有 Swift 提交中击败了 5.77% 的用户
// Runtime: 4 ms, faster than 97.95% of Swift online submissions for Jewels and Stones.
// Memory Usage: 20.5 MB, less than 7.69% of Swift online submissions for Jewels and Stones.
class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        
        let s = Set(J)
        var r = 0
        for c in S {
            if s.contains(c) {
                r += 1
            }
        }
        return r
    }
}

let s = Solution()
print(s.numJewelsInStones("aA", "aAAbbbb"))
print(s.numJewelsInStones("z", "ZZ"))


