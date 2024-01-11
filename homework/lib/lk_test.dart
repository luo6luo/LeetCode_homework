import 'package:flutter/material.dart';

class LKTest extends StatefulWidget {
  const LKTest({Key? key}) : super(key: key);

  @override
  State<LKTest> createState() => _LKTestState();
}

class _LKTestState extends State<LKTest> {
  /// 1. 两数之和
  List<int> twoSum(List<int> nums, int target) {
    for (int i = 0; i < nums.length; i++) {
      final num2 = target - nums[i];
      if (nums.contains(num2)) {
        final index = nums.lastIndexOf(num2);
        if (i != index) return [i, index];
      }
    }

    return [0, 0];
  }

  /// 1480. 一维数组的动态和
  List<int> runningSum(List<int> nums) {
    if (nums.length <= 1) return nums;

    List<int> result = [];
    // 方法一
    // nums.fold<int>(0, (previousValue, element) {
    //   final sum = previousValue + element;
    //   result.add(sum);
    //   return sum;
    // });

    // 方法二，执行时间少于方法一
    int sum = 0;
    for (var element in nums) {
      sum += element;
      result.add(sum);
    }

    return result;
  }

  /// 1342. 将数字变成 0 的操作次数
  int numberOfSteps(int num) {
    if (num == 0) return 0;

    int stepNum = 0;
    int temp = num;
    while (temp != 0) {
      if (temp.isEven) {
        temp = temp ~/ 2;
      } else {
        temp = temp - 1;
      }
      stepNum++;
    }

    return stepNum;
  }

  /// 1672. 最富有客户的资产总量
  int maximumWealth(List<List<int>> accounts) {
    int max = 0;
    for (var element in accounts) {
      final sum = element.reduce((value, element) => value + element);
      if (sum > max) max = sum;
    }

    return max;
  }

  /// 2696. 删除子串后的字符串最小长度
  int minLength(String s) {
    String a = s;
    final regExp = RegExp(r'AB|CD');
    while (a.contains(regExp)) {
      a = a.replaceAll(regExp, '');
    }
    return a.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LeetCode')),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              List<int> nums = [2, 5, 5, 11];
              int target = 10;
              final r = twoSum(nums, target);
              debugPrint('$r');
            },
            child: const Text('两数之和'),
          ),
          ElevatedButton(
            onPressed: () {
              List<int> nums = [2, 5, 5, 11];
              final r = runningSum(nums);
              debugPrint('$r');
            },
            child: const Text('一维数组的动态和'),
          ),
          ElevatedButton(
            onPressed: () {
              final r = numberOfSteps(14);
              debugPrint('$r');
            },
            child: const Text('将数字变成 0 的操作次数'),
          ),
          ElevatedButton(
            onPressed: () {
              List<List<int>> accounts = [
                [1, 2, 3],
                [3, 2, 1]
              ];
              final r = maximumWealth(accounts);
              debugPrint('$r');
            },
            child: const Text('最富有客户的资产总量'),
          ),
          ElevatedButton(
            onPressed: () {
              const s = "ABFCACDB";
              final r = minLength(s);
              debugPrint('$r');
            },
            child: const Text('删除子串后的字符串最小长度'),
          ),
        ],
      ),
    );
  }
}
