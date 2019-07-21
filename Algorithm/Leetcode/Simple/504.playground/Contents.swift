import UIKit

/**
 给定一个整数，将其转化为7进制，并以字符串形式输出。

 示例 1:

 输入: 100
 输出: "202"
 示例 2:

 输入: -7
 输出: "-10"
 注意: 输入范围是 [-1e7, 1e7]
 */

/*
 执行用时 :8 ms, 在所有 Swift 提交中击败了87.50%的用户
 内存消耗 :20.7 MB, 在所有 Swift 提交中击败了20.00%的用户
 
 Runtime: 4 ms, faster than 88.24% of Swift online submissions for Base 7.
 Memory Usage: 20.7 MB, less than 20.00% of Swift online submissions for Base 7.
 */
class Solution {
    func convertToBase7(_ num: Int) -> String {
        return String(num, radix: 7)
    }
}

var s = Solution()
print(s.convertToBase7(7))
