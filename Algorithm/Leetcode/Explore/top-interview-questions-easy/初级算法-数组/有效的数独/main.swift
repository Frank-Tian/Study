//
//  main.swift
//  有效的数独
//
//  Created by Frank.Tian on 2019/8/28.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/**
 https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/30/
 判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。

 数字 1-9 在每一行只能出现一次。
 数字 1-9 在每一列只能出现一次。
 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。


 上图是一个部分填充的有效的数独。

 数独部分空格内已填入了数字，空白格用 '.' 表示。

 示例 1:

 输入:
 [
   ['5','3','.','.','7','.','.','.','.'],
   ['6','.','.','1','9','5','.','.','.'],
   ['.','9','8','.','.','.','.','6','.'],
   ['8','.','.','.','6','.','.','.','3'],
   ['4','.','.','8','.','3','.','.','1'],
   ['7','.','.','.','2','.','.','.','6'],
   ['.','6','.','.','.','.','2','8','.'],
   ['.','.','.','4','1','9','.','.','5'],
   ['.','.','.','.','8','.','.','7','9']
 ]
 输出: true
 示例 2:

 输入:
 [
   ['8','3','.','.','7','.','.','.','.'],
   ['6','.','.','1','9','5','.','.','.'],
   ['.','9','8','.','.','.','.','6','.'],
   ['8','.','.','.','6','.','.','.','3'],
   ['4','.','.','8','.','3','.','.','1'],
   ['7','.','.','.','2','.','.','.','6'],
   ['.','6','.','.','.','.','2','8','.'],
   ['.','.','.','4','1','9','.','.','5'],
   ['.','.','.','.','8','.','.','7','9']
 ]
 输出: false
 解释: 除了第一行的第一个数字从 5 改为 8 以外，空格内其他数字均与 示例1 相同。
      但由于位于左上角的 3x3 宫内有两个 8 存在, 因此这个数独是无效的。
 说明:

 一个有效的数独（部分已被填充）不一定是可解的。
 只需要根据以上规则，验证已经填入的数字是否有效即可。
 给定数独序列只包含数字 1-9 和字符 '.' 。
 给定数独永远是 9x9 形式的。
 */

class Solution1 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        func unduplicatedCheck(_ chars : [Character]) -> Bool {
            var s:[Character:Character] = [:];
            for c in chars {
                if c != "." {
                    if s[c] != nil {
                        return false
                    } else {
                        s[c] = c
                    }
                }
            }
            return true
        }
        
        for i in board {
            let lineCheck = unduplicatedCheck(i)
            if !lineCheck {
                return false
            }
        }
        
        for i in 0...8 {
            var col:[Character] = []
            for arr in board {
                col.append(arr[i])
            }
            let columnCheck = unduplicatedCheck(col)
            if !columnCheck {
                return false
            }
        }
    
        var y = 0
        for _ in 0...2 {
            var nums:[Character] = []
            for index in 1...9 {
                for line in y...y+2 {
                    nums.append(board[index-1][line])
                    // print("\(index-1)-\(line)")
                }
                
                if index % 3 == 0 {
                    let columnCheck = unduplicatedCheck(nums)
                    // print(nums)
                    if !columnCheck {
                        return false
                    }
                    nums = []
                }
            }
            y += 3
        }
        return true
    }
}

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        func unduplicatedCheck(_ chars : [Character]) -> Bool {
            var s:[Character:Character] = [:];
            for c in chars {
                if c != "." {
                    if s[c] != nil {
                        return false
                    } else {
                        s[c] = c
                    }
                }
            }
            return true
        }
        
        for (i,v) in board.enumerated() {
            let lineCheck = unduplicatedCheck(v)
            if !lineCheck {
                return false
            }
            
            var col:[Character] = []
            for arr in board {
                col.append(arr[i])
            }
            let columnCheck = unduplicatedCheck(col)
            if !columnCheck {
                return false
            }
        }
    
        var y = 0
        for _ in 0...2 {
            var nums:[Character] = []
            for index in 1...9 {
                for line in y...y+2 {
                    nums.append(board[index-1][line])
                    // print("\(index-1)-\(line)")
                }
                
                if index % 3 == 0 {
                    let columnCheck = unduplicatedCheck(nums)
                    // print(nums)
                    if !columnCheck {
                        return false
                    }
                    nums = []
                }
            }
            y += 3
        }
        return true
    }
}

let s = Solution()
let board:[[Character]] =  [
  ["5","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]
let res = s.isValidSudoku(board)
print(res)

let board2:[[Character]] =  [
  ["8","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]

let res2 = s.isValidSudoku(board2)
print(res2)

let board3:[[Character]] =  [
    [".",".","4",".",".",".","6","3","."],
    [".",".",".",".",".",".",".",".","."],
    ["5",".",".",".",".",".",".","9","."],
    [".",".",".","5","6",".",".",".","."],
    ["4",".","3",".",".",".",".",".","1"],
    [".",".",".","7",".",".",".",".","."],
    [".",".",".","5",".",".",".",".","."],
    [".",".",".",".",".",".",".",".","."],
    [".",".",".",".",".",".",".",".","."]
]
let res3 = s.isValidSudoku(board3)
print(res3)

let board4:[[Character]] =  [
    [".",".","."  ,".",".",".",  "5",".","."],
    [".",".","."  ,".",".",".",  ".",".","."],
    [".",".","."  ,".",".",".",  ".",".","."],
    
    ["9","3","."  ,".","2",".",  "4",".","."],
    [".",".","7"  ,".",".",".",  "3",".","."],
    [".",".","."  ,".",".",".",  ".",".","."],
    
    [".",".","."  ,"3","4",".",  ".",".","."],
    [".",".","."  ,".",".","3",  ".",".","."],
    [".",".","."  ,".",".","5",  "2",".","."]
]
let res4 = s.isValidSudoku(board4)
print(res4)
