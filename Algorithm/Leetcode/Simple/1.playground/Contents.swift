import UIKit

/*
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */


/*
 Runtime: 340 ms, faster than 33.06% of Swift online submissions for Two Sum.
 Memory Usage: 21.3 MB, less than 5.12% of Swift online submissions for Two Sum.
 */
class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [Int]()
        for i in 0 ..< nums.count {

            let item = nums[i]
            let other = target - item
            
            for j in i + 1 ..< nums.count {
                if other == nums[j] {
                    res.append(i)
                    res.append(j)
                    return res
                }
            }
        }
        return res
    }
}

/**
 Runtime: 28 ms, faster than 99.52% of Swift online submissions for Two Sum.
 Memory Usage: 21.2 MB, less than 5.12% of Swift online submissions for Two Sum.
 */
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [Int]()
        var dict = [Int:Int]()
        
        for i in 0 ..< nums.count {
            let l = nums[i]
            let r = target - l
            let ri:Int = dict[r] ?? 0
            if ri > 0 {
                if i != ri - 1 {
                    res.append(ri - 1)
                    res.append(i)
                    return res
                }
            }
            dict[l] = i + 1
        }
        return res
    }
}

var s = Solution()
print(s.twoSum([2, 7, 11, 15], 9))
print(s.twoSum([3,3], 6))
print(s.twoSum([0, 4, 3, 0], 0))
print(s.twoSum([-1, -2, -3, -4, -5], -8))
print(s.twoSum([3, 2, 4], 6))

