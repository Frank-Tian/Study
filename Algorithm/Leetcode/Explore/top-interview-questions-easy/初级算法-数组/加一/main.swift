//
//  main.swift
//  加一
//
//  Created by Frank.Tian on 2019/8/28.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 
 加一
 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
 
 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
 
 你可以假设除了整数 0 之外，这个整数不会以零开头。
 
 示例 1:
 
 输入: [1,2,3]
 输出: [1,2,4]
 解释: 输入数组表示数字 123。
 示例 2:
 
 输入: [4,3,2,1]
 输出: [4,3,2,2]
 解释: 输入数组表示数字 4321。
 
 */

//swift我的提交执行用时已经战胜 83.95 % 的 swift 提交记录

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        let c = digits.count - 1
        var t = digits
        for i in 0...c {
            let b = t[c-i]
            switch b {
            case 0...8:
                t[c-i] = b + 1
                return t
            case 9:
                t[c-i] = 0
                if i == c {
                    t.insert(1, at: 0)
                }
            default:break
            }
        }
        return t
    }
}

let s = Solution()
print(s.plusOne([1,2,3]))
print(s.plusOne([4,3,2,1]))
print(s.plusOne([1,9,9]))
print(s.plusOne([8,9,9]))
print(s.plusOne([9,9,9,9]))

