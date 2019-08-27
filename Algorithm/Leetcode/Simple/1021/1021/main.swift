//
//  main.swift
//  1021
//
//  Created by Frank.Tian on 2019/8/27.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 
 有效括号字符串为空 ("")、"(" + A + ")" 或 A + B，其中 A 和 B 都是有效的括号字符串，+ 代表字符串的连接。例如，""，"()"，"(())()" 和 "(()(()))" 都是有效的括号字符串。
 
 如果有效字符串 S 非空，且不存在将其拆分为 S = A+B 的方法，我们称其为原语（primitive），其中 A 和 B 都是非空有效括号字符串。
 
 给出一个非空有效字符串 S，考虑将其进行原语化分解，使得：S = P_1 + P_2 + ... + P_k，其中 P_i 是有效括号字符串原语。
 
 对 S 进行原语化分解，删除分解中每个原语字符串的最外层括号，返回 S 。
 
   
 
 示例 1：
 
 输入："(()())(())"
 输出："()()()"
 解释：
 输入字符串为 "(()())(())"，原语化分解得到 "(()())" + "(())"，
 删除每个部分中的最外层括号后得到 "()()" + "()" = "()()()"。
 示例 2：
 
 输入："(()())(())(()(()))"
 输出："()()()()(())"
 解释：
 输入字符串为 "(()())(())(()(()))"，原语化分解得到 "(()())" + "(())" + "(()(()))"，
 删除每隔部分中的最外层括号后得到 "()()" + "()" + "()(())" = "()()()()(())"。
 示例 3：
 
 输入："()()"
 输出：""
 解释：
 输入字符串为 "()()"，原语化分解得到 "()" + "()"，
 删除每个部分中的最外层括号后得到 "" + "" = ""。
   
 
 提示：
 
 S.length <= 10000
 S[i] 为 "(" 或 ")"
 S 是一个有效括号字符串
 
 */


// 执行用时 : 4364 ms , 在所有 Swift 提交中击败了 7.89% 的用户
// 内存消耗 : 20.7 MB , 在所有 Swift 提交中击败了 50.00% 的用户

// Runtime: 2724 ms, faster than 5.40% of Swift online submissions for Remove Outermost Parentheses.
// Memory Usage: 20.9 MB, less than 33.33% of Swift online submissions for Remove Outermost Parentheses.
class Solution1 {
    func removeOuterParentheses(_ S: String) -> String {
        
        var t = 0
        let p = S
        var r = ""
        var left = p.startIndex
        for i in 0..<p.count {
            if p[p.index(p.startIndex, offsetBy: i)] == "(" {
                t += 1
            } else {
                t -= 1
            }
            
            if t == 0 {
                let right = p.index(p.startIndex, offsetBy: i)
                let item = p[left...right]
                if item.count > 2 {
                    r += p[p.index(after: left)...p.index(before: right)]
                }
                left = p.index(after: right)
            }
        }
        return r
    }
}
// 执行用时 : 16 ms , 在所有 Swift 提交中击败了 94.74% 的用户
// 内存消耗 : 20.3 MB , 在所有 Swift 提交中击败了 50.00% 的用户
// Runtime: 12 ms
// Memory Usage: 20.6 MB
class Solution {
    func removeOuterParentheses(_ S: String) -> String {
        
        var t = 0
        var r = ""
        for c in S {
            switch c {
            case "(":
                if t != 0 {
                    r.append(c)
                }
                t += 1
            case ")":
                t -= 1
                if t != 0 {
                    r.append(c)
                }
            default: break
                
            }
        }
        return r
    }
}

let s = Solution()
print(s.removeOuterParentheses("(()())(())"))
print(s.removeOuterParentheses("(()())(())(()(()))"))
print(s.removeOuterParentheses("()()"))
