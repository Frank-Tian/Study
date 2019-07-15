import UIKit

class Solution1 {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        
        var res = [Int]()
        func selfDivi(_ num: Int) -> Bool {
            let str = String(num)
            let characters = Array(str)
            for n in characters {
                let m = Int(String(n))!
                if m == 0 || num % m != 0 {
                    return false
                }
            }
            return true
        }
        
        for i in left...right {
            if selfDivi(i)  {
                res.append(i)
            }
        }
        return res
    }
}

class Solution2 {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        
        var res = [Int]()

        for i in left...right {
            let str = String(i)
            let characters = Array(str)
            var s = true
            for n in characters {
                let m = Int(String(n))!
                if m == 0 || i % m != 0 {
                    s = false
                    break;
                }
            }
            if s {
                res.append(i)
            }
        }
        return res
    }
}

class Solution {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        
        var res = [Int]()
        
        loop: for i in left...right {
            
            var n = i
            while n != 0 {
                // exsit zero
                if n % 10 == 0 {
                    continue loop
                }
                if i % (n % 10) != 0 {
                    continue loop
                }
                n = n / 10
            }
            res.append(i)
        }
        return res
    }
}

var s = Solution()
var arr = s.selfDividingNumbers(1, 22)
print(arr)


