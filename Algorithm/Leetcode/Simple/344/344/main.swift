//
//  main.swift
//  344
//
//  Created by Frank.Tian on 2019/8/28.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 
 344. 反转字符串
 编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。
 
 不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。
 
 你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。
 
   
 
 示例 1：
 
 输入：["h","e","l","l","o"]
 输出：["o","l","l","e","h"]
 示例 2：
 
 输入：["H","a","n","n","a","h"]
 输出：["h","a","n","n","a","H"]
 
 */

// 执行用时 :412 ms , 在所有 Swift 提交中击败了 85.62% 的用户
// 内存消耗 :24.5 MB, 在所有 Swift 提交中击败了 5.32% 的用户
// Runtime: 276 ms, faster than 73.44% of Swift online submissions for Reverse String.
// Memory Usage: 24.5 MB, less than 25.00% of Swift online submissions for Reverse String.
class Solution1 {
    func reverseString(_ s: inout [Character]) {
        
        let t = s.count
        let c = t % 2 == 0 ? t / 2 : (t - 1) / 2
        for i in 0..<c {
            let temp = s[i]
            s[i] = s[t-1-i]
            s[t-1-i] = temp
        }
    }
}

// sample 260 ms submission
class Solution {
    func reverseString(_ s: inout [Character]) {
        var first = 0
        var last = s.count - 1
        while first < last {
            (s[first], s[last]) = (s[last], s[first])
            first += 1
            last -= 1
        }
    }
}

let s = Solution()
var a:[Character] = ["h","e","l","l","o"]
var b:[Character] = ["H","a","n","n","a","h"]
s.reverseString(&a)
s.reverseString(&b)
print(a)
print(b)
