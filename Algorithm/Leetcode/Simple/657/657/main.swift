//
//  main.swift
//  657
//
//  Created by Frank.Tian on 2019/8/27.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/*
 657. 机器人能否返回原点
 
 在二维平面上，有一个机器人从原点 (0, 0) 开始。给出它的移动顺序，判断这个机器人在完成移动后是否在 (0, 0) 处结束。
 
 移动顺序由字符串表示。字符 move[i] 表示其第 i 次移动。机器人的有效动作有 R（右），L（左），U（上）和 D（下）。如果机器人在完成所有动作后返回原点，则返回 true。否则，返回 false。
 
 注意：机器人“面朝”的方向无关紧要。 “R” 将始终使机器人向右移动一次，“L” 将始终向左移动等。此外，假设每次移动机器人的移动幅度相同。
 
   
 
 示例 1:
 
 输入: "UD"
 输出: true
 解释：机器人向上移动一次，然后向下移动一次。所有动作都具有相同的幅度，因此它最终回到它开始的原点。因此，我们返回 true。
 示例 2:
 
 输入: "LL"
 输出: false
 解释：机器人向左移动两次。它最终位于原点的左侧，距原点有两次 “移动” 的距离。我们返回 false，因为它在移动结束时没有返回原点。

 */

// 执行用时 :232 ms , 在所有 Swift 提交中击败了 5.26% 的用户
// 内存消耗 : 20.6 MB , 在所有 Swift 提交中击败 5.88% 的用户
// Runtime: 228 ms, faster than 5.80% of Swift online submissions for Robot Return to Origin.
// Memory Usage: 20.8 MB, less than 100.00% of Swift online submissions for Robot Return to Origin.
class Solution1 {
    func judgeCircle(_ moves: String) -> Bool {
        var v = 0
        var h = 0
        for c in moves {
            print(c)
            switch c {
            case "U":
                h += 1
            case "D":
                h -= 1
            case "L":
                v -= 1
            case "R":
                v += 1
            default:break
            }
        }
        return v == 0 && h == 0
    }
}

// !!!!!!!!!!!!!!!!! 上面多了一句打印 !!!!!!!!!!!!!!!!!!!!!!!!!!
// 执行用时 :44 ms , 在所有 Swift 提交中击败了 84.21% 的用户
// 内存消耗 : 20.3 MB , 在所有 Swift 提交中击败了 5.88% 的用户
// Runtime: 28 ms, faster than 92.27% of Swift online submissions for Robot Return to Origin.
// Memory Usage: 20.7 MB, less than 100.00% of Swift online submissions for Robot Return to Origin.
class Solution2 {
    func judgeCircle(_ moves: String) -> Bool {
        var v = 0
        var h = 0
        for c in moves {
            switch c {
            case "U":
                h += 1
            case "D":
                h -= 1
            case "L":
                v -= 1
            case "R":
                v += 1
            default:break
            }
        }
        return v == 0 && h == 0
    }
}

class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        
        if moves.count % 2 != 0 {
            return false
        }
        
        var v = 0
        var h = 0
        for c in moves {
            switch c {
            case "U":
                h += 1
            case "D":
                h -= 1
            case "L":
                v -= 1
            case "R":
                v += 1
            default:break
            }
        }
        return v == 0 && h == 0
    }
}

let s = Solution()
print(s.judgeCircle("UD"))
print(s.judgeCircle("LL"))
