import UIKit

/**
 示例 1:
 
 输入: nums1 = [1,2,2,1], nums2 = [2,2]
 输出: [2,2]
 示例 2:
 
 输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 输出: [4,9]
 说明：
 
 输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
 我们可以不考虑输出结果的顺序。
**/

// 40 ms | 20.7 MB
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var res = [Int]()
        var dict = [Int:Int]()
        
        for i in nums1 {
            let val:Int = dict[i] ?? 0
            if (val > 0) {
                dict[i] = val + 1
            } else {
                dict[i] = 1
            }
        }
        for i in nums2 {
            let val:Int = dict[i] ?? 0
            if (val > 0) {
                if (val > 1) {
                    dict[i] = val - 1
                } else {
                    dict[i] = nil
                }
                res.append(i)
            }
        }
        
        return res
    }
}

//let n1 = [4,9,5], n2 = [9,4,9,8,4]
let n1 = [1,2,2,1], n2 = [2,2]
var s = Solution()
var res = s.intersect(n2, n1)
print(res)
