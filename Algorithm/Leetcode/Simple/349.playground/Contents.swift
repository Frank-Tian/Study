import UIKit

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var res = Set<Int>()
        
        var dict = [Int:Int]()
        for i in nums1 {
            dict[i] = 1
        }
        for i in nums2 {
            let value = dict[i]
            if (value != nil) {
                res.insert(i)
            }
        }
        
        return Array(res)
    }
}

var s = Solution()
var n1 = [1,2,2,1]
var n2 = [2,2]
var res1 = s.intersection(n1, n2)
var res2 = s.intersection([4,9,5], [9,4,9,8,4])
print(res1)
print(res2)

