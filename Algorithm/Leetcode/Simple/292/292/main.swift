//
//  main.swift
//  292
//
//  Created by Frank.Tian on 2019/8/27.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 292. Nim 游戏
 
 你和你的朋友，两个人一起玩 Nim 游戏：桌子上有一堆石头，每次你们轮流拿掉 1 - 3 块石头。 拿掉最后一块石头的人就是获胜者。你作为先手。
 
 你们是聪明人，每一步都是最优解。 编写一个函数，来判断你是否可以在给定石头数量的情况下赢得游戏。
 
 示例:
 
 输入: 4
 输出: false
 解释: 如果堆中有 4 块石头，那么你永远不会赢得比赛；
           因为无论你拿走 1 块、2 块 还是 3 块石头，最后一块石头总是会被你的朋友拿走。

 如果堆里有5块石头，你能想出一个办法把石头移走，这样你就永远是赢家吗？
 */

// 执行用时 :4 ms, 在所有 Swift 提交中击败了94.29%的用户
// 内存消耗 :20 MB, 在所有 Swift 提交中击败了6.67%的用户
// Runtime: 4 ms, faster than 82.61% of Swift online submissions for Nim Game.
// Memory Usage: 20.8 MB, less than 100.00% of Swift online submissions for Nim Game.
class Solution1 {
    func canWinNim(_ n: Int) -> Bool {
        return n % 4 != 0
    }
}

class Solution {
    func canWinNim(_ n: Int) -> Bool {
        if n < 4 {
            return true
        }
        return n % 4 != 0
    }
}

let s = Solution()
print(s.canWinNim(1))
print(s.canWinNim(2))
print(s.canWinNim(3))
print(s.canWinNim(4))
print(s.canWinNim(5))
print(s.canWinNim(6))
print(s.canWinNim(7))
print(s.canWinNim(8))
print(s.canWinNim(9))
print(s.canWinNim(10))
