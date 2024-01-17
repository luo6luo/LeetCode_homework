import 'package:flutter/material.dart';
import 'package:homework/medium_test.dart';
import 'package:homework/simple_test.dart';

import 'difficult_test.dart';

class LKTest extends StatefulWidget {
  const LKTest({Key? key}) : super(key: key);

  @override
  State<LKTest> createState() => _LKTestState();
}

class _LKTestState extends State<LKTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LeetCode')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SimpleTest()),
                );
              },
              child: const Text('简单'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MediumTest()),
                );
              },
              child: const Text('中等'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DifficultTest()),
                );
              },
              child: const Text('困难'),
            ),
          ],
        ),
      ),
    );
  }
}
