//
//  main.swift
//  1051
//
//  Created by Frank.Tian on 2019/8/27.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 
 1051. 高度检查器
 
 学校在拍年度纪念照时，一般要求学生按照 非递减 的高度顺序排列。
 
 请你返回至少有多少个学生没有站在正确位置数量。该人数指的是：能让所有学生以 非递减 高度排列的必要移动人数。
 
   
 
 示例：
 
 输入：[1,1,4,2,1,3]
 输出：3
 解释：
 高度为 4、3 和最后一个 1 的学生，没有站在正确的位置。
   
 
 提示：
 
 1 <= heights.length <= 100
 1 <= heights[i] <= 100
 
 */

// 执行用时 : 28 ms , 在所有 Swift 提交中击败了 42.11% 的用户
// 内存消耗 : 20.7 MB, 在所有 Swift 提交中击败了 100.00% 的用户
// Runtime: 20 ms, faster than 40.74% of Swift online submissions for Height Checker.
// Memory Usage: 21.4 MB, less than 100.00% of Swift online submissions for Height Checker.
class Solution1 {
    func heightChecker(_ heights: [Int]) -> Int {
        var r = 0
        let a = heights.sorted { (arg0, arg1) -> Bool in
            arg0 <= arg1
        }
        for (i,v) in a.enumerated() {
            //print("\(i)  \(v)")
            if v != heights[i] {
                r += 1
            }
        }
        return r
    }
}

// Runtime: 16 ms, faster than 87.65% of Swift online submissions for Height Checker.
// Memory Usage: 21.4 MB, less than 100.00% of Swift online submissions for Height Checker.
class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var r = 0
        let a = heights.sorted()
        for (i,v) in a.enumerated() {
            //print("\(i)  \(v)")
            if v != heights[i] {
                r += 1
            }
        }
        return r
    }
}

let s = Solution()
print(s.heightChecker([1,1,4,2,1,3]))

