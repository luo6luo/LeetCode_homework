import 'dart:math';

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

  /// 412. Fizz Buzz
  List<String> fizzBuzz(int n) {
    List<String> r = [];
    for (int i = 1; i <= n; i++) {
      if (i % 15 == 0) {
        r.add('FizzBuzz');
      } else if (i % 3 == 0) {
        r.add('Fizz');
      } else if (i % 5 == 0) {
        r.add('Buzz');
      } else {
        r.add(i.toString());
      }
    }
    return r;
  }

  /// 876. 链表的中间结点
  ///
  /// * 解法：快慢指针
  ///
  /// * [ListNode] 是自定义类，在👇
  ListNode? middleNode(ListNode? head) {
    ListNode? fast = head;
    ListNode? slow = head;
    while (fast != null && fast.next != null) {
      fast = fast.next?.next;
      slow = slow?.next;
    }
    return slow;
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

  /// 1672. 最富有客户的资产总量
  int maximumWealth(List<List<int>> accounts) {
    int max = 0;
    for (var element in accounts) {
      final sum = element.reduce((value, element) => value + element);
      if (sum > max) max = sum;
    }

    return max;
  }

  /// 2085. 统计出现过一次的公共字符串
  int countWords(List<String> words1, List<String> words2) {
    Map<String, int> map1 = {};
    for (int i = 0; i < words1.length; i++) {
      final word = words1[i];
      map1[word] = (map1[word] ?? 0) + 1;
    }

    Map<String, int> map2 = {};
    int count = 0;
    for (var word in words2) {
      if (map1[word] == 1) {
        if (map2[word] == null) {
          count++;
        } else if (map2[word] == 1) {
          count--;
        }
        map2[word] = (map2[word] ?? 0) + 1;
      }
    }

    return count;
  }

  /// 2645. 构造有效字符串的最少插入数
  ///
  /// * 解法：贪心算法，和前面的字母组合成最有效的字符
  /// * [中等]，官网解更优 []()
  int addMinimum(String word) {
    int operationCount = 0;
    bool isStart = true; // 是否是abc从头开始计算，之前的已经符合规定
    for (int i = 0; i < word.length; i++) {
      final current = word[i];

      if (isStart) {
        final pre = i - 1 >= 0 ? word[i - 1] : null;
        if (current == 'b' && pre != 'a') {
          operationCount++;
          isStart = false;
        } else if (current == 'c' && pre != 'b') {
          operationCount += 2;
        }
      }

      final next = i + 1 < word.length ? word[i + 1] : null;
      if (current == 'a' && next != 'b') {
        if (next == 'c') {
          i++;
          operationCount++;
        } else {
          operationCount += 2;
        }
        isStart = true;
      } else if (current == 'b' && next != 'c') {
        operationCount++;
        isStart = true;
      } else if (current == 'c') {
        isStart = true;
      }
    }

    return operationCount;
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
            child: const Text('1. 两数之和'),
          ),
          ElevatedButton(
            onPressed: () {
              final r = fizzBuzz(15);
              debugPrint('$r');
            },
            child: const Text('412. Fizz Buzz'),
          ),
          ElevatedButton(
            onPressed: () {
              // 创建链表 [1,2,3,4,5]
              ListNode head = ListNode(
                  1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));
              final r = middleNode(head);
              debugPrint(r.toString());
            },
            child: const Text('876. 链表的中间结点'),
          ),
          ElevatedButton(
            onPressed: () {
              final r = numberOfSteps(14);
              debugPrint('$r');
            },
            child: const Text('1342. 将数字变成 0 的操作次数'),
          ),
          ElevatedButton(
            onPressed: () {
              List<int> nums = [2, 5, 5, 11];
              final r = runningSum(nums);
              debugPrint('$r');
            },
            child: const Text('1480. 一维数组的动态和'),
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
            child: const Text('1672. 最富有客户的资产总量'),
          ),
          ElevatedButton(
            onPressed: () {
              final word1 = ["a", "ab"];
              final word2 = ["a", "a", "a", "ab"];
              final r = countWords(word1, word2);
              debugPrint('$r');
            },
            child: const Text('2085. 统计出现过一次的公共字符串'),
          ),
          ElevatedButton(
            onPressed: () {
              final r = addMinimum("c");
              debugPrint('$r');
            },
            child: const Text('2645. 构造有效字符串的最少插入数'),
          ),
          ElevatedButton(
            onPressed: () {
              const s = "ABFCACDB";
              final r = minLength(s);
              debugPrint('$r');
            },
            child: const Text('2696. 删除子串后的字符串最小长度'),
          ),
        ],
      ),
    );
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  @override
  String toString() => '$val';
}
