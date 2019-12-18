//
//  main.swift
//  只出现一次的数字
//
//  Created by Frank.Tian on 2019/8/28.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
 
 说明：
 
 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
 
 示例 1:
 
 输入: [2,2,1]
 输出: 1
 示例 2:
 
 输入: [4,1,2,1,2]
 输出: 4
 */

// 已经战胜 57.92 % 的 swift 提交记录
class Solution1 {
    func singleNumber(_ nums: [Int]) -> Int {
        
        var t = Dictionary<Int, Int>()
        for i in nums {
            
            if let k = t[i] {
                if k == 1 {
                    t .removeValue(forKey: i)
                }
            } else {
                t[i] = 1
            }
        }
        return t.keys.first ?? 0
    }
}

// 执行用时为 108 ms 的范例

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {

        var r = 0
        for i in nums {
            r = r ^ i
        }
        return r
    }
}


let s = Solution()
print(s.singleNumber([2,2,1]))
print(s.singleNumber([4,1,2,1,2]))
