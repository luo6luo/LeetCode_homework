import 'package:flutter/material.dart';
import 'package:homework/view.dart';

import 'mould.dart';

class MediumTest extends StatefulWidget {
  const MediumTest({super.key});

  @override
  State<MediumTest> createState() => _MediumTestState();
}

class _MediumTestState extends State<MediumTest> {
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

  /// 2645. 构造有效字符串的最少插入数
  ///
  /// * 解法：贪心算法，和前面的字母组合成最有效的字符
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

  @override
  Widget build(BuildContext context) {
    final data = [
      ButtonData('82. 删除排序链表中的重复元素 II', deleteDuplicates_82),
      ButtonData('2645. 构造有效字符串的最少插入数', addMinimum_2645),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('MediumTest')),
      body: ListView(children: data.map((e) => TestButton(e)).toList()),
    );
  }

  void deleteDuplicates_82() {
    // 创建链表
    ListNode head =
        ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3)))));
    final r = deleteDuplicates(head);
    debugPrint(r.toString());
  }

  void addMinimum_2645() {
    final r = addMinimum("c");
    debugPrint('$r');
  }
}