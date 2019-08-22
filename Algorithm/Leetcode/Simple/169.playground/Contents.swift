import UIKit

/*:
 给定一个大小为 n 的数组，找到其中的众数。众数是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。
 
 你可以假设数组是非空的，并且给定的数组总是存在众数。
 
 示例 1:
 
 输入: [3,2,3]
 输出: 3
 
 示例 2:
 
 输入: [2,2,1,1,1,2,2]
 输出: 2
 
 */

/*:
 
 执行用时 :228 ms , 在所有 Swift 提交中击败了 66.67% 的用户
 
 内存消耗 : 22.7 MB , 在所有 Swift 提交中击败了 5.30% 的用户
 
 https://leetcode.com
 
 Runtime: 156 ms, faster than 46.47% of Swift online submissions for Majority Element.
 
 Memory Usage: 23.3 MB, less than 33.33% of Swift online submissions for Majority Element.
 */
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var r = 0
        var res: [Int:Int] = [:]
        for i in nums {
            if let a = res[i] {
                res[i] = a + 1
            } else {
                res[i] = 1
            }
        }
        let c = res.filter { (arg0) -> Bool in
            arg0.value > nums.count / 2
        }
        if let k = c.first?.key {
            r = k
        }
        return r
    }
}

/*:
 sample 112 ms submission
 */
class Solution1 {
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 0
        var result = nums[0]
        for i in 0..<nums.count {
            if count == 0 {
                print("nums[i] \(nums[i])")
                result = nums[i]
            }
            count += nums[i] == result ? 1 : -1
            print("count \(count)")
        }
        return result
    }
}

var s = Solution1()
print(s.majorityElement([3,2,3]))
//print(s.majorityElement([2,2,1,1,1,2,2]))
