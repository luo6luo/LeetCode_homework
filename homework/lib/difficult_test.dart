import 'package:flutter/material.dart';
import 'package:homework/view.dart';

import 'mould.dart';

class DifficultTest extends StatefulWidget {
  const DifficultTest({super.key});

  @override
  State<DifficultTest> createState() => _DifficultTestState();
}

class _DifficultTestState extends State<DifficultTest> {
  /// 2719. 统计整数数目（困难）
  int count(String num1, String num2, int min_sum, int max_sum) {
    // 计算过程超时
    // 各数动态规划模板: https://leetcode.cn/problems/count-special-integers/solutions/1746956/shu-wei-dp-mo-ban-by-endlesscheng-xtgx/
    int count = 0;
    for (int i = int.parse(num1); i <= int.parse(num2); i++) {
      int sum = 0;
      int num = i;
      while (num > 0) {
        sum += num % 10;
        num = num ~/ 10;
      }
      if (sum >= min_sum && sum <= max_sum) count++;
    }

    return count % (10 ^ 9 + 7);
  }

  /// 2809. 使数组和小于等于 x 的最少时间
  ///
  /// 题目：https://leetcode.cn/problems/minimum-time-to-make-array-sum-at-most-x/?envType=daily-question&envId=2024-01-19
  ///
  /// 思路：
  /// 1. 每秒增加 num2 各数和，删除 i 位的数
  int minimumTime(List<int> nums1, List<int> nums2, int x) {
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    final data = [
      ButtonData('2719. 统计整数数目', count_2719),
      ButtonData('2809. 使数组和小于等于 x 的最少时间', minimumTime_2809),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('DifficultTest')),
      body: ListView(children: data.map((e) => TestButton(e)).toList()),
    );
  }

  void count_2719() {
    const num1 = '1';
    const num2 = '12';
    const min_sum = 1;
    const max_sum = 8;
    final r = count(num1, num2, min_sum, max_sum);
    debugPrint('$r');
  }

  void minimumTime_2809() {
    final nums1 = [1, 2, 3];
    final nums2 = [1, 2, 3];
    const x = 4;
    final r = minimumTime(nums1, nums2, x);
    debugPrint('$r');
  }
}
