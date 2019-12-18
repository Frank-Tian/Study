//
//  main.swift
//  旋转图像
//
//  Created by Frank.Tian on 2019/8/28.
//  Copyright © 2019 Frank. All rights reserved.
//

import Foundation

/**
 给定一个 n × n 的二维矩阵表示一个图像。

 将图像顺时针旋转 90 度。

 说明：

 你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。

 示例 1:

 给定 matrix =
 [
   [1,2,3],
   [4,5,6],
   [7,8,9]
 ],

 原地旋转输入矩阵，使其变为:
 [
   [7,4,1],
   [8,5,2],
   [9,6,3]
 ]
 示例 2:

 给定 matrix =
 [
   [ 5, 1, 9,11],
   [ 2, 4, 8,10],
   [13, 3, 6, 7],
   [15,14,12,16]
 ],

 原地旋转输入矩阵，使其变为:
 [
   [15,13, 2, 5],
   [14, 3, 4, 1],
   [12, 6, 8, 9],
   [16, 7,10,11]
 ]
 */

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        
        for (i,v) in matrix.enumerated() {
            for j in 0...matrix.count/2 {
                matrix[i][j] = matrix[i][j];
            }
        }
//
////                print(j)
//            }
    }
}


let s = Solution()
var matr = [
  [ 5, 1, 9,11],
  [ 2, 4, 8,10],
  [13, 3, 6, 7],
  [15,14,12,16]
]

var c1 = [
  [ 5, 1, 9,11],
  [ 2, 4, 8,10],
  [13, 3, 6, 7],
  [15,14,12,16]
]
var c2 = [
  [ 5, 1, 9,11],
  [ 2, 4, 8,10],
  [13, 3, 6, 7],
  [15,14,12,16]
]
var c3 = [
  [ 5, 1, 9],
  [ 2, 4, 8],
  [13, 3, 6],
]
var c4 = [
  [1]
]
var c5 = [
    [1,2],
    [3,4]
]
//s.rotate(&matr)
//print(matr)
//s.rotate(&c1)
//s.rotate(&c2)
s.rotate(&c3)
//s.rotate(&c4)
//s.rotate(&c5)
//print(c1)
//print(c2)
//print(c3)
//print(c4)
//print(c5)


