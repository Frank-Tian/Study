import UIKit

/*:
 国际摩尔斯密码定义一种标准编码方式，将每个字母对应于一个由一系列点和短线组成的字符串， 比如: "a" 对应 ".-", "b" 对应 "-...", "c" 对应 "-.-.", 等等。
 
 为了方便，所有26个英文字母对应摩尔斯密码表如下：
 
 [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
 
 给定一个单词列表，每个单词可以写成每个字母对应摩尔斯密码的组合。例如，"cab" 可以写成 "-.-..--..."，(即 "-.-." + "-..." + ".-"字符串的结合)。我们将这样一个连接过程称作单词翻译。
 
 返回我们可以获得所有词不同单词翻译的数量。
 
 例如:
 
 输入: words = ["gin", "zen", "gig", "msg"]
 输出: 2
 
 解释:
 
 各单词翻译如下:
 - "gin" -> "--...-."
 - "zen" -> "--...-."
 - "gig" -> "--...--."
 - "msg" -> "--...--."
 
 共有 2 种不同翻译, "--...-." 和 "--...--.".
   
 
 注意:
 
 - 单词列表words 的长度不会超过 100。
 - 每个单词 words[i]的长度范围为 [1, 12]。
 - 每个单词 words[i]只包含小写字母。
 */

/*:
 
 leetcode-cn.com
 
 执行用时 :24 ms , 在所有 Swift 提交中击败了 88.89% 的用户

 内存消耗 : 21.3 MB , 在所有 Swift 提交中击败了 8.70% 的用户
 
 leetcode.com
 
 Runtime: 12 ms, faster than 99.46% of Swift online submissions for Unique Morse Code Words.
 
 Memory Usage: 21.3 MB, less than 50.00% of Swift online submissions for Unique Morse Code Words.
 */
class Solution1 {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        
        let a: UInt8 = 97
        let b = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        var res = Set<String>()
        for i in words {
            var combined = ""
            for j in i.indices {
                if let code = i[j].asciiValue {
                    let index = Int(code - a)
                    //print("\(i[j]) \(v[index])")
                    combined += b[index]
                }
            }
            res.insert(combined)
            //print(combined)
        }
        return res.count
    }
}

/*:
 
 leetcode-cn.com

 执行用时 : 20 ms , 在所有 Swift 提交中击败了 100.00% 的用户

 内存消耗 : 21.1 MB , 在所有 Swift 提交中击败了 8.70% 的用户
 
 leetcode.com

 Runtime: 8 ms, faster than 100.00% of Swift online submissions for Unique Morse Code Words.
 
 Memory Usage: 21 MB, less than 50.00% of Swift online submissions for Unique Morse Code Words.
 
 */
class Solution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        
        let b = ["a":".-","b":"-...","c":"-.-.","d":"-..","e":".","f":"..-.","g":"--.","h":"....","i":"..","j":".---","k":"-.-","l":".-..","m":"--","n":"-.","o":"---","p":".--.","q":"--.-","r":".-.","s":"...","t":"-","u":"..-","v":"...-","w":".--","x":"-..-","y":"-.--","z":"--.."]
        var res = Set<String>()
        for i in words {
            var combined = ""
            for j in 0..<i.count {
                if let s = b[String(i[i.index(i.startIndex, offsetBy: j)])] {
                    combined += s
                }
                //print("\(i[j]) \(v[index])")
            }
            res.insert(combined)
        }
        return res.count
    }
}

/*:
 
 Other perfect solution
 */
class Solution2 {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let morse: [Character : String] = ["a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.", "g": "--.", "h": "....", "i": "..", "j": ".---", "k": "-.-", "l": ".-..", "m": "--", "n": "-.", "o": "---", "p": ".--.", "q": "--.-", "r": ".-.", "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--", "x": "-..-", "y": "-.--", "z": "--.."]
        
        return words.reduce(into: Set<String>()) {
            let transform = $1.reduce(into: "") { $0 += morse[$1] ?? "" }
            $0.insert(transform)
            }.count
    }
}

var s = Solution()

print(s.uniqueMorseRepresentations(["gin", "zen", "gig", "msg"]))


























