import UIKit

/*:
 给定一个二进制矩阵 A，我们想先水平翻转图像，然后反转图像并返回结果。
 
 水平翻转图片就是将图片的每一行都进行翻转，即逆序。例如，水平翻转 [1, 1, 0] 的结果是 [0, 1, 1]。
 
 反转图片的意思是图片中的 0 全部被 1 替换， 1 全部被 0 替换。例如，反转 [0, 1, 1] 的结果是 [1, 0, 0]。
 
 示例 1:
 
 输入: [[1,1,0],[1,0,1],[0,0,0]]
 输出: [[1,0,0],[0,1,0],[1,1,1]]
 
 解释: 首先翻转每一行: [[0,1,1],[1,0,1],[0,0,0]]；
 然后反转图片: [[1,0,0],[0,1,0],[1,1,1]]
 
 示例 2:
 
 输入: [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]
 输出: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]

 解释: 首先翻转每一行: [[0,0,1,1],[1,0,0,1],[1,1,1,0],[0,1,0,1]]；
 然后反转图片: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]

 说明:
 
 1 <= A.length = A[0].length <= 20
 0 <= A[i][j] <= 1

 */

/*:
 
 执行用时 : 48 ms , 在所有 Swift 提交中击败了 81.13% 的用户
 
 内存消耗 : 21.1 MB , 在所有 Swift 提交中击败了 5.88%的用户
 
 */
class Solution {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        return A.map { (arg0) -> [Int] in
            return arg0.reversed().map({ (arg1) -> Int in
                arg1 == 1 ? 0 : 1
            })
        }
    }
}

// 执行用时为 28 ms 的范例
class Solution1 {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        let rowSize = A.count
        let colSize = A[0].count
        var result = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: colSize), count: rowSize)
        for i in 0..<rowSize {
            for j in 0..<colSize {
                let ele = A[i][j] == 1 ? 0 : 1
                result[i][colSize - j - 1] = ele
            }
        }
        return result
    }
}

// sample 28 ms submission
class Solution2 {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var result = A
        for index in 0..<result.count {
            var row = result[index]
            row = row.reversed()
            row = row.map{ $0 == 0 ? 1: 0}
            result[index] = row
        }
        return result
    }
}

var s = Solution()
print(s.flipAndInvertImage([[1,1,0],[1,0,1],[0,0,0]]))
print(s.flipAndInvertImage( [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]))





















