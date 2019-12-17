//
//  main.swift
//  旋转数组
//
//  Created by Frank.Tian on 2019/8/28.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 
 输入: [1,2,3,4,5,6,7] 和 k = 3
 输出: [5,6,7,1,2,3,4]
 解释:
 向右旋转 1 步: [7,1,2,3,4,5,6]
 向右旋转 2 步: [6,7,1,2,3,4,5]
 向右旋转 3 步: [5,6,7,1,2,3,4]
 示例 2:

 输入: [-1,-100,3,99] 和 k = 2
 输出: [3,99,-1,-100]
 解释:
 向右旋转 1 步: [99,-1,-100,3]
 向右旋转 2 步: [3,99,-1,-100]
 说明:

 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
 要求使用空间复杂度为 O(1) 的 原地 算法。
 */
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if k > 0 {
            for _ in 1...k {
                let temp = nums.last!
                nums.removeLast()
                nums.insert(temp, at: 0)
            }
        }
    }
}


let s = Solution()
var input = [1,2,3,4,5,6,7]
let k = 3
s.rotate(&input, k)
print(input)
var input1 = [-1,-100,3,99]
let k1 = 2
s.rotate(&input1, k1)
print(input1)
var input2 = [1]
let k2 = 0
s.rotate(&input2, k2)
print(input2)
var input3 = [1,2]
let k3 = 3
s.rotate(&input3, k3)
print(input3)

var num = [1, 2, 3, 4, 5, 6, 7]
/////// [5, 6, 7,| 1, 2, 3, 4]
s.rotate(&num, 3)
print(num)

var num2 = [-1,-100,3,99]
s.rotate(&num2, 2)
print(num2)

var num3 = [1,2]
s.rotate(&num3, 3)
print(num3)

var num4 = [1]
s.rotate(&num4, 0)
print(num4)
