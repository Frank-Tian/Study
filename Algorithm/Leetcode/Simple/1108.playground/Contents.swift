import UIKit

// 8ms
class Solution {
    func defangIPaddr(_ address: String) -> String {

        return address.replacingOccurrences(of: ".", with: "[.]")
    }
}

// 4ms 
class Solution1 {
    func defangIPaddr(_ address: String) -> String {
        var new = String()
        for  char in address.indices{
            if address[char] == "."{
                new.append("[.]")
            }else{
                new.append(address[char])
            }
        }
        return new
    }
}

/**
 输入：address = "1.1.1.1"
 输出："1[.]1[.]1[.]1"
 
 输入：address = "255.100.50.0"
 输出："255[.]100[.]50[.]0"
 */
var addr = "255.100.50.0"//"1.1.1.1"
var s = Solution()
var res = s.defangIPaddr(addr)
print(res)
