import UIKit

/**
 给定一个非负整数 num，反复将各个位上的数字相加，直到结果为一位数。

 示例:
 输入: 38
 输出: 2
 解释: 各位相加的过程为：3 + 8 = 11, 1 + 1 = 2。 由于 2 是一位数，所以返回 2。
 进阶:
 你可以不使用循环或者递归，且在 O(1) 时间复杂度内解决这个问题吗？
 
 思路：emm。。很神奇，首先考虑数是否为0，如果是0则返回0，如果不是0，则求出该数对9取余得数，如果余数为0，则返回9，否则返回余数。
 在网上看了下大神的解释，可以这样理解：

 假设一个四位数num = ABCD；即num=A*1000+B*100+C*10+D;
 num=A+B+C+D+(A*999+B*99+C*9)
 这样左边的数就是各位数的和，而右边的数一直都能被9整除；如果A+B+C+D大于9了，则可以再次套用上面的公式，所以对9取余即可。
 */

/**
 Runtime: 4 ms, faster than 100.00% of Swift online submissions for Add Digits.
 Memory Usage: 20.5 MB, less than 7.32% of Swift online submissions for Add Digits.
 */
class Solution {
    func addDigits(_ num: Int) -> Int {
        
        return num > 0 ? ((num % 9)>0 ? num % 9 : 9) : 0;
    }
}

class Solution1 {
    func addDigits(_ num: Int) -> Int {
        return 1 + ((num - 1) % 9)
    }
}


var s = Solution()
print(s.addDigits(13222))

