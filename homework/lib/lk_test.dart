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

  /// 82. 删除排序链表中的重复元素
  ListNode? deleteDuplicates(ListNode? head) {
    ListNode? r = head;

    int? preVal; // 标记上一个值（已经删除的）
    ListNode? current = r;
    ListNode? next = r?.next;
    while (current != null) {
      if (preVal == current.val || current.val == next?.val) {
        // 删除当前节点
        if (r?.val == current.val) {
          // 启动头往后移
          r = current.next;
        } else {
          ListNode? cur = r; // 找到r中需要删除的当前节点
          while (cur?.next?.val != current.val) {
            cur = cur?.next;
          }
          cur?.next = current.next;
        }
      }

      preVal = current.val;
      current = current.next;
      next = current?.next;
    }

    return r;
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
    final data = [
      _ButtonData('1. 两数之和', _1twoSum),
      _ButtonData('82. 删除排序链表中的重复元素 II', _82deleteDuplicates),
      _ButtonData('383. 赎金信', _383canConstruct),
      _ButtonData('412. Fizz Buzz', _412fizzBuzz),
      _ButtonData('876. 链表的中间结点', _876middleNode),
      _ButtonData('1342. 将数字变成 0 的操作次数', _1342numberOfSteps),
      _ButtonData('1480. 一维数组的动态和', _1480runningSum),
      _ButtonData('1672. 最富有客户的资产总量', _1672maximumWealth),
      _ButtonData('2085. 统计出现过一次的公共字符串', _2085countWords),
      _ButtonData('2645. 构造有效字符串的最少插入数', _2645addMinimum),
      _ButtonData('2696. 删除子串后的字符串最小长度', _2696minLength),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('LeetCode')),
      body: ListView(children: data.map((e) => _Button(e)).toList()),
    );
  }

  void _1twoSum() {
    List<int> nums = [2, 5, 5, 11];
    int target = 10;
    final r = twoSum(nums, target);
    debugPrint('$r');
  }

  void _82deleteDuplicates() {
    // 创建链表
    ListNode head =
        ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3)))));
    final r = deleteDuplicates(head);
    debugPrint(r.toString());
  }

  void _383canConstruct() {
    final r = canConstruct("aa", "ab");
    debugPrint('$r');
  }

  void _412fizzBuzz() {
    final r = fizzBuzz(15);
    debugPrint('$r');
  }

  void _876middleNode() {
    // 创建链表 [1,2,3,4,5]
    ListNode head =
        ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));
    final r = middleNode(head);
    debugPrint(r.toString());
  }

  void _1342numberOfSteps() {
    final r = numberOfSteps(14);
    debugPrint('$r');
  }

  void _1480runningSum() {
    List<int> nums = [2, 5, 5, 11];
    final r = runningSum(nums);
    debugPrint('$r');
  }

  void _1672maximumWealth() {
    List<List<int>> accounts = [
      [1, 2, 3],
      [3, 2, 1]
    ];
    final r = maximumWealth(accounts);
    debugPrint('$r');
  }

  void _2085countWords() {
    final word1 = ["a", "ab"];
    final word2 = ["a", "a", "a", "ab"];
    final r = countWords(word1, word2);
    debugPrint('$r');
  }

  void _2645addMinimum() {
    final r = addMinimum("c");
    debugPrint('$r');
  }

  void _2696minLength() {
    const s = "ABFCACDB";
    final r = minLength(s);
    debugPrint('$r');
  }
}

class _ButtonData {
  final VoidCallback onPressed;
  final String title;
  _ButtonData(this.title, this.onPressed);
}

class _Button extends StatelessWidget {
  const _Button(this.data);
  final _ButtonData data;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: data.onPressed,
      child: Text(data.title),
    );
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  // @override
  // String toString() {
  //   List list = [val];
  //   while (next != null) {
  //     list.add(next?.val);
  //   }
  //
  //   return list.toString();
  // }
}
