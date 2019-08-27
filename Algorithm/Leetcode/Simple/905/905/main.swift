//
//  main.swift
//  905
//
//  Created by Frank.Tian on 2019/8/27.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 905. 按奇偶排序数组
 
 给定一个非负整数数组 A，返回一个数组，在该数组中， A 的所有偶数元素之后跟着所有奇数元素。
 
 你可以返回满足此条件的任何数组作为答案。
 
 示例：
 
 输入：[3,1,2,4]
 输出：[2,4,3,1]
 输出 [4,2,3,1]，[2,4,1,3] 和 [4,2,1,3] 也会被接受。
   
 
 提示：
 
 1 <= A.length <= 5000
 0 <= A[i] <= 5000
 
 */

// 执行用时 :224 ms , 在所有 Swift 提交中击败了 5.63% 的用户
// 内存消耗 :21.2 MB , 在所有 Swift 提交中击败了 6.45% 的用户
// Runtime: 80 ms, faster than 43.28% of Swift online submissions for Sort Array By Parity.
// Memory Usage: 21.3 MB, less than 25.00% of Swift online submissions for Sort Array By Parity.
class Solution1 {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        
        var res: [Int] = []
        
        for i in A {
            if i % 2 == 0 {
                res.insert(i, at: 0)
            } else {
                res.append(i)
            }
        }
        
        return res
    }
}

// 执行用时 :108 ms , 在所有 Swift 提交中击败了 66.20% 的用户
// 内存消耗 : 21 MB , 在所有 Swift 提交中击败了 6.45% 的用户
// Runtime: 68 ms, faster than 95.77% of Swift online submissions for Sort Array By Parity.
// Memory Usage: 21.5 MB, less than 25.00% of Swift online submissions for Sort Array By Parity.
class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        
        var res: [Int] = Array(repeating: 0, count: A.count)
        var l = 0, r = A.count - 1
        for i in 0..<A.count {
            if A[i] % 2 == 0 {
                res[l] = A[i]
                l += 1
            } else {
                res[r] = A[i]
                r -= 1
            }
        }
        
        return res
    }
}

let s = Solution()
print(s.sortArrayByParity([3,1,2,4]))
