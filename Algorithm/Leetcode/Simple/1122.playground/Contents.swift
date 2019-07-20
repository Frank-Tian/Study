import UIKit

/**
 1122. 数组的相对排序
 给你两个数组，arr1 和 arr2，

 arr2 中的元素各不相同
 arr2 中的每个元素都出现在 arr1 中
 对 arr1 中的元素进行排序，使 arr1 中项的相对顺序和 arr2 中的相对顺序相同。未在 arr2 中出现过的元素需要按照升序放在 arr1 的末尾。
 
 示例：
 输入：arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
 输出：[2,2,2,1,4,3,3,9,6,7,19]
 */


/**
 Runtime: 12 ms, faster than 96.88% of Swift online submissions for Relative Sort Array.
 Memory Usage: 22.8 MB, less than 100.00% of Swift online submissions for Relative Sort Array.
 
 执行用时 : 28 ms, 在所有 Swift 提交中击败了60.00% 的用户
 内存消耗 : 22.4 MB, 在所有 Swift 提交中击败了 100.00%的用户
 */
class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var res = [Int]()
        var store = [Int:Int]()
        var els = [Int:Int]()
        var other = [Int]()
        
        for i in arr2 {
            store[i] = 1
        }
        
        for j in arr1 {
            let val:Int = store[j] ?? 0
            if val > 0 {
                store[j] = val + 1
            } else {
                let v:Int = els[j] ?? 0
                if v > 0 {
                    els[j] = v + 1
                } else {
                    els[j] = 1
                }
            }
        }
        
        for i in arr2 {
            let val:Int = store[i] ?? 0
            for _ in 1..<val {
                res.append(i)
            }
        }
        
        let arr = els.sorted(by: {$0.0 < $1.0})
        for (key, value) in arr {
            for i in 0..<value {
                other.append(key)
            }
        }
        res.append(contentsOf: other)
        return res
    }
}

//let n1 = [2,3,1,3,2,4,6,7,9,2,19], n2 = [2,1,4,3,9,6]
let n1 = [28,6,22,8,44,17], n2 = [22,28,8,6]
var s = Solution()
var res = s.relativeSortArray(n1, n2)
print(res)
// [2,2,2,1,4,3,3,9,6,7,19]
// [22,28,8,6,17,44]
