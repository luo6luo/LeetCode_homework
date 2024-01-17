import 'package:flutter/material.dart';

import 'mould.dart';

class TestButton extends StatelessWidget {
  const TestButton(this.data, {super.key});
  final ButtonData data;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ElevatedButton(
        onPressed: data.onPressed,
        child: Text(data.title),
      ),
    );
  }
}
