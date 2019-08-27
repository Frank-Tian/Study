//
//  main.swift
//  977
//
//  Created by Frank.Tian on 2019/8/27.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 977. 有序数组的平方
 
 给定一个按非递减顺序排序的整数数组 A，返回每个数字的平方组成的新数组，要求也按非递减顺序排序。
 
 示例 1：
 
 输入：[-4,-1,0,3,10]
 输出：[0,1,9,16,100]
 
 示例 2：
 
 输入：[-7,-3,2,3,11]
 输出：[4,9,9,49,121]
   
 
 提示：
 
    1 <= A.length <= 10000
    -10000 <= A[i] <= 10000
    A 已按非递减顺序排序。

 */

// 执行用时 :596 ms, 在所有 Swift 提交中击败了63.16%的用户
// 内存消耗 :22.7 MB, 在所有 Swift 提交中击败了6.25%的用户
// Runtime: 420 ms, faster than 17.39% of Swift online submissions for Squares of a Sorted Array.
// Memory Usage: 22.7 MB, less than 33.33% of Swift online submissions for Squares of a Sorted Array.
class Solution1 {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var res:[Int] = []
        for value in A {
            res.append(value*value)
        }
        return res.sorted()
    }
}

class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        return A.map({ $0 * $0}).sorted()
    }
}

let s = Solution()
print(s.sortedSquares([-4,-1,0,3,10]))
print(s.sortedSquares([-7,-3,2,3,11]))
