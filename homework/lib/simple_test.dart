import 'package:flutter/material.dart';
import 'package:homework/view.dart';

import 'mould.dart';

class SimpleTest extends StatefulWidget {
  const SimpleTest({super.key});

  @override
  State<SimpleTest> createState() => _SimpleTestState();
}

class _SimpleTestState extends State<SimpleTest> {
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

  /// 383. 赎金信
  bool canConstruct(String ransomNote, String magazine) {
    for (var note in ransomNote.split('')) {
      if (magazine.contains(note)) {
        magazine = magazine.replaceFirst(note, '');
      } else {
        return false;
      }
    }

    return true;
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

  /// 2696. 删除子串后的字符串最小长度
  int minLength(String s) {
    String a = s;
    final regExp = RegExp(r'AB|CD');
    while (a.contains(regExp)) {
      a = a.replaceAll(regExp, '');
    }
    return a.length;
  }

  /// 2744. 最大字符串配对数目
  int maximumNumberOfStringPairs(List<String> words) {
    // int count = 0;
    // bool needRefresh = false;
    // for (int i = 0; i < words.length;) {
    //   List<String> list = words[i].split('');
    //   list.sort((l, r) => 1);
    //   final word = list.join('');
    //
    //   for (int j = i + 1; j < words.length; j++) {
    //     if (word == words[j]) {
    //       words.removeAt(j);
    //       words.removeAt(i);
    //       count++;
    //       needRefresh = true;
    //       break;
    //     }
    //   }
    //
    //   i = needRefresh ? 0 : i + 1;
    //   needRefresh = false;
    // }
    //
    // return count;

    // 灵神单循环解题法：https://leetcode.cn/problems/find-maximum-number-of-string-pairs/solutions/2607365/on-yi-ci-bian-li-pythonjavacgojsrust-by-l9jat/?envType=daily-question&envId=2024-01-17
    int count = 0;
    List<String> cache = [];
    for (String word in words) {
      if (cache.contains(word.split('').reversed.join(''))) {
        count++;
      } else {
        // 没有被匹配到，则加入缓存中，让下一个字符匹配
        cache.add(word);
      }
    }

    return count;
  }

  @override
  Widget build(BuildContext context) {
    final data = [
      ButtonData('1. 两数之和', twoSum_1),
      ButtonData('383. 赎金信', canConstruct_383),
      ButtonData('412. Fizz Buzz', fizzBuzz_412),
      ButtonData('876. 链表的中间结点', middleNode_876),
      ButtonData('1342. 将数字变成 0 的操作次数', numberOfSteps_1342),
      ButtonData('1480. 一维数组的动态和', runningSum_1480),
      ButtonData('1672. 最富有客户的资产总量', maximumWealth_1672),
      ButtonData('2085. 统计出现过一次的公共字符串', countWords_2085),
      ButtonData('2696. 删除子串后的字符串最小长度', minLength_2696),
      ButtonData('2744. 最大字符串配对数目', maximumNumberOfStringPairs_2744),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('SimpleTest')),
      body: ListView.builder(
        itemBuilder: (_, index) => TestButton(data[index]),
        itemCount: data.length,
      ),
    );
  }

  void twoSum_1() {
    List<int> nums = [2, 5, 5, 11];
    int target = 10;
    final r = twoSum(nums, target);
    debugPrint('$r');
  }

  void canConstruct_383() {
    final r = canConstruct("aa", "ab");
    debugPrint('$r');
  }

  void fizzBuzz_412() {
    final r = fizzBuzz(15);
    debugPrint('$r');
  }

  void middleNode_876() {
    // 创建链表 [1,2,3,4,5]
    ListNode head =
        ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));
    final r = middleNode(head);
    debugPrint(r.toString());
  }

  void numberOfSteps_1342() {
    final r = numberOfSteps(14);
    debugPrint('$r');
  }

  void runningSum_1480() {
    List<int> nums = [2, 5, 5, 11];
    final r = runningSum(nums);
    debugPrint('$r');
  }

  void maximumWealth_1672() {
    List<List<int>> accounts = [
      [1, 2, 3],
      [3, 2, 1]
    ];
    final r = maximumWealth(accounts);
    debugPrint('$r');
  }

  void countWords_2085() {
    final word1 = ["a", "ab"];
    final word2 = ["a", "a", "a", "ab"];
    final r = countWords(word1, word2);
    debugPrint('$r');
  }

  void minLength_2696() {
    const s = "ABFCACDB";
    final r = minLength(s);
    debugPrint('$r');
  }

  void maximumNumberOfStringPairs_2744() {
    final words = ["zs", "pp", "sz", "ie"];
    final r = maximumNumberOfStringPairs(words);
    debugPrint('$r');
  }
}
