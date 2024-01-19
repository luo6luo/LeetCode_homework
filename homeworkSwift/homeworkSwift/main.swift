//
//  main.swift
//  homeworkSwift
//
//  Created by lg on 2024/1/19.
//

import Foundation

// MARK: - 50. 宝石补给

/// LCP 50. 宝石补给
func giveGem(_ gem: [Int], _ operations: [[Int]]) -> Int {
  var gemData = gem;
  for value in operations {
    let count = gemData[value[0]] / 2
    gemData[value[0]] = gemData[value[0]] - count
    gemData[value[1]] = gemData[value[1]] + count
  }
  gemData.sort {$0 < $1}

  return gemData.last! - gemData.first!;
}

let r = giveGem(
  [0,0,0,0],
  [[1,2],[3,1],[1,2]]
)
print(r)

