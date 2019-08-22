//
//  main.swift
//  268
//
//  Created by Frank.Tian on 2019/8/22.
//  Copyright © 2019 Frank. All rights reserved.
//

/*:
 给定一个包含 0, 1, 2, ..., n 中 n 个数的序列，找出 0 .. n 中没有出现在序列中的那个数。
 
 示例 1:
 
 输入: [3,0,1]
 输出: 2
 
 示例 2:
 
 输入: [9,6,4,2,3,5,7,0,1]
 输出: 8
 
 说明:
 你的算法应具有线性时间复杂度。你能否仅使用额外常数空间来实现?
 */

class Solution1 {
    func missingNumber(_ nums: [Int]) -> Int {
        var val = 0
        var dict = [1:false]
        for i in nums {
            dict[i] = true
        }
        for j in 0...nums.count {
            if let a = dict[j] {
                if !a {
                    val = j
                    break
                }
            } else {
                val = j
                break
            }
        }
        return val
    }
}

// Nice sample 148 ms submission
class Solution2 {
    func missingNumber(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0, +)
        let n = nums.count+1
        let actual = (n*(n-1))/2
        return actual - sum
    }
}

// Good sample 132 ms submission
class Solution3 {
    func missingNumber(_ nums: [Int]) -> Int {
        var expectedValue = (nums.count) * (nums.count+1) / 2
        for i in 0..<nums.count {
            expectedValue -= nums[i]
        }
        return expectedValue
    }
}

// sample 124 ms submission
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var missingTotalSum = 0
        var totalSum = 0
        for i in 0..<nums.count {
            missingTotalSum += nums[i]
            totalSum += i + 1
        }
        return totalSum - missingTotalSum
    }
    
}

var s = Solution()
print(s.missingNumber([0]))
print(s.missingNumber([1]))
print(s.missingNumber([3,0,1,4,2]))
print(s.missingNumber([3,0,1]))
print(s.missingNumber( [9,6,4,2,3,5,7,0,1]))
//1
//0
//5
//2
//8





