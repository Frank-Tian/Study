import UIKit

class Solution {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var res = [Int]()
        var a1 = [Int]()
        var a2 = [Int]()
        if A.count > 1 {
            
            for i in A {
                if i % 2 == 0 {
                    a1.append(i)
                } else {
                    a2.append(i)
                }
            }
            for j in 0..<a1.count {
                res.append(a1[j])
                res.append(a2[j])
            }
            return res
        } else {
            return A
        }
    }
}

class Solution1 {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        guard A.count > 1 else {
            return A
        }
        
        var A = A
        var evenPointer = 0
        var oddPointer = 1
        while evenPointer < A.count {
            
            if A[evenPointer] % 2 == 0 {
                evenPointer += 2
            } else {
                A.swapAt(evenPointer, oddPointer)
                oddPointer += 2
            }
        }
        return A
    }
}

var n = [4,2,5,7]
var s = Solution()
var res = s.sortArrayByParityII(n)
print(res)
