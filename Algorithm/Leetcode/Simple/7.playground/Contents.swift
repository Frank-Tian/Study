import UIKit

/**
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
 
 示例 1: 输入: 123 输出: 321
 示例 2: 输入: -123 输出: -321
 示例 3: 输入: 120 输出: 21
 注意:假设我们的环境只能存储得下 32 位的有符号整数，
 则其数值范围为 [−2的31次方,  2的31次方 − 1]。
 请根据这个假设，如果反转后整数溢出那么就返回 0。
 */

/**
 Runtime: 4 ms, faster than 98.07% of Swift online submissions for Reverse Integer.
 Memory Usage: 20.6 MB, less than 5.28% of Swift online submissions for Reverse Integer.
 
 1032 / 1032 个通过测试用例
 执行用时：12 ms 已经战胜 85.81 % 的 swift 提交记录
 */
class Solution {
    func reverse(_ x: Int) -> Int {
        
        func reve(_ n: Int) -> Int {
            var v = n
            var res = Int()
            while v > 0 {
                res = res * 10 + v % 10
                v = v / 10
            }
            return res
        }
        
        func check(_ n: Int) -> Int {
            let p:Int = Int(pow(2.0,31.0))
            let max = p - 1
            let min = -p
            if n <= max && n >= min{
                return n
            } else {
                return 0
            }
        }
        
        if x > 0 {
            return check(reve(x))
        } else {
            return check(-reve(-x))
        }
    }
}
/**
 Runtime: 4 ms, faster than 98.07% of Swift online submissions for Reverse Integer.
 Memory Usage: 20.6 MB, less than 5.28% of Swift online submissions for Reverse Integer.
 */
class Solution1 {
    func reverse(_ x: Int) -> Int {
        
        func reve(_ n: Int) -> Int {
            var v = n
            var res = Int()
            while v > 0 {
                res = res * 10 + v % 10
                v = v / 10
            }
            return res
        }
        
        func check(_ n: Int) -> Int {
            if n <= Int32.max && n >= Int32.min{
                return n
            } else {
                return 0
            }
        }
        
        if x > 0 {
            return check(reve(x))
        } else {
            return check(-reve(-x))
        }
    }
}

/*
 Runtime: 8 ms, faster than 83.00% of Swift online submissions for Reverse Integer.
 Memory Usage: 20.6 MB, less than 5.28% of Swift online submissions for Reverse Integer.
 */
class Solution2 {
    func reverse(_ x: Int) -> Int {
        
        func reve(_ n: Int) -> Int {
            var v = n
            var res = Int()
            while v > 0 {
                res = res * 10 + v % 10
                if res > Int32.max || res < Int32.min {
                    return 0
                }
                v = v / 10
            }
            return res
        }
        
        if x > 0 {
            return reve(x)
        } else {
            return -reve(-x)
        }
    }
}

var s = Solution()
print(s.reverse(123))
print(s.reverse(-123))
print(s.reverse(120))
print(s.reverse(-2147483648))
print(s.reverse(1534236469))
print(s.reverse(1000000003))
