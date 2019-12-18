//
//  main.swift
//  移动零
//
//  Created by Frank.Tian on 2019/8/28.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 移动零
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 
 示例:
 
 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:
 
 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。
 */

// 我的提交执行用时已经战胜 84.55 % 的 swift 提交记录
class Solution1 {
    func moveZeroes(_ nums: inout [Int]) {
        
        let n1 = nums.filter { (arg0) -> Bool in
            arg0 == 0
        }
        nums = nums.filter { (arg0) -> Bool in
            arg0 != 0
        }
        nums.append(contentsOf: Array(repeating: 0, count: n1.count))
    }
}

// 这种方案较慢，500ms + 
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        
        var r = true
        var c = 0
        repeat {
            if let index = nums.firstIndex(of: 0) {
                nums.remove(at: index)
                c += 1
            } else {
                r = false
            }
        } while r
        nums.append(contentsOf: Array(repeating: 0, count: c))
    }
}

let s = Solution()
//var i = [0,0,1]
var i = [0,1,0,3,12]
s.moveZeroes(&i)
print(i)
