//
//  main.swift
//  1025
//
//  Created by Frank.Tian on 2019/8/27.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 1025. 除数博弈
 
 爱丽丝和鲍勃一起玩游戏，他们轮流行动。爱丽丝先手开局。
 
 最初，黑板上有一个数字 N 。在每个玩家的回合，玩家需要执行以下操作：
 
 选出任一 x，满足 0 < x < N 且 N % x == 0 。
 用 N - x 替换黑板上的数字 N 。
 如果玩家无法执行这些操作，就会输掉游戏。
 
 只有在爱丽丝在游戏中取得胜利时才返回 True，否则返回 false。假设两个玩家都以最佳状态参与游戏。
 
   
 
 示例 1：
 
 输入：2
 输出：true
 解释：爱丽丝选择 1，鲍勃无法进行操作。
 
 
 示例 2：
 
 输入：3
 输出：false
 解释：爱丽丝选择 1，鲍勃也选择 1，然后爱丽丝无法进行操作。
   
 
 提示：
 
 1 <= N <= 1000
 */

// 执行用时 : 4 ms , 在所有 Swift 提交中击败了 94.44% 的用户
// 内存消耗 : 20.2 MB , 在所有 Swift 提交中击败了 100.00% 的用户
class Solution {
    func divisorGame(_ N: Int) -> Bool {
        return N % 2 == 0
    }
}

let s = Solution()
print(s.divisorGame(1))
print(s.divisorGame(2))
print(s.divisorGame(3))
print(s.divisorGame(4))
print(s.divisorGame(5))
print(s.divisorGame(6))
