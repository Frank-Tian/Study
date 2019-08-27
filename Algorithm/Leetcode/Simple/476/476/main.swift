//
//  main.swift
//  476
//
//  Created by Frank.Tian on 2019/8/27.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 476. 数字的补数
 给定一个正整数，输出它的补数。补数是对该数的二进制表示取反。
 
 注意:
 
 给定的整数保证在32位带符号整数的范围内。
 你可以假定二进制数不包含前导零位。
 示例 1:
 
 输入: 5
 输出: 2
 解释: 5的二进制表示为101（没有前导零位），其补数为010。所以你需要输出2。

 示例 2:
 
 输入: 1
 输出: 0
 解释: 1的二进制表示为1（没有前导零位），其补数为0。所以你需要输出0。
 
 */

// 执行用时 :4 ms , 在所有 Swift 提交中击败了 95.83% 的用户
// 内存消耗 : 20.6 MB , 在所有 Swift 提交中击败了 20.00% 的用户
// Runtime: 4 ms, faster than 92.31% of Swift online submissions for Number Complement.
// Memory Usage: 20.7 MB, less than 100.00% of Swift online submissions for Number Complement.
class Solution1 {
    func findComplement(_ num: Int) -> Int {
        let b = String(num, radix: 2)
        var r = ""
        for i in b {
            if i == "0" {
                r += "1"
            } else {
                r += "0"
            }
        }
        if let res = Int(r, radix: 2) {
            return res
        }
        return 0
    }
}

// sample 0 ms submission
class Solution2 {
    func findComplement(_ num: Int) -> Int {
        var i = 1
        
        while i <= num {
            i <<= 1
        }
        
        return (i - 1) ^ num
    }
}

// 执行用时为 0 ms 的范例
class Solution {
    func findComplement(_ num: Int) -> Int {
        
        var temp = num
        while temp & (temp - 1) != 0 { temp = temp & (temp - 1) }
        temp = ((temp - 1) << 1) + 1
        return num ^ temp
        
    }
}

let s = Solution()
print(s.findComplement(1))
print(s.findComplement(2))
print(s.findComplement(3))
print(s.findComplement(5))
