//
//  main.swift
//  存在重复
//
//  Created by Frank.Tian on 2019/8/28.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 给定一个整数数组，判断是否存在重复元素。
 
 如果任何值在数组中出现至少两次，函数返回 true。如果数组中每个元素都不相同，则返回 false。
 
 示例 1:
 
 输入: [1,2,3,1]
 输出: true
 示例 2:
 
 输入: [1,2,3,4]
 输出: false
 示例 3:
 
 输入: [1,1,1,3,3,4,3,2,4,2]
 输出: true
 */

// 已经战胜 83.85 % 的 swift 提交记录
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {

        var c = 0
        var t:Set<Int> = Set()
        for i in nums {
            t.insert(i)
            c += 1
            if t.count < c {
                return true
            }
        }
        
        return false
    }
}

let s = Solution()
print(s.containsDuplicate([1,2,3,1]))
print(s.containsDuplicate([1,2,3,4]))
print(s.containsDuplicate([1,1,1,3,3,4,3,2,4,2]))
