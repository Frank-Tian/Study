//
//  main.swift
//  有效的字母异位词
//
//  Created by Frank.Tian on 2019/12/18.
//  Copyright © 2019 Frank.Tian. All rights reserved.
//

import Foundation

/**
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

 示例 1:

 输入: s = "anagram", t = "nagaram"
 输出: true
 示例 2:

 输入: s = "rat", t = "car"
 输出: false
 说明:
 你可以假设字符串只包含小写字母。

 进阶:
 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？
 */

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        if s.count != t.count {
            return false
        }
        var ms:[Character:Int] = [:]
        var ts:[Character:Int] = [:]
        for i in s {
            if let c = ms[i] {
                ms[i] = c+1
            } else {
                ms[i] = 1
            }
        }
        
        for i in t {
            if let c = ts[i] {
                ts[i] = c+1
            } else {
                ts[i] = 1
            }
        }
        let keys = ms.keys.sorted()
        if !keys.elementsEqual(ts.keys.sorted()) {
            return false
        }
        for key in keys {
            let v1 = ms[key]
            let v2 = ts[key]
            if v1 != v2 {
                return false
            }
        }

        return true
    }
}

let s = Solution()
print(s.isAnagram("atc", "cat"))
print(s.isAnagram("anagram", "nagaram"))
print(s.isAnagram("abvc🐂", "a🐂bvc"))
