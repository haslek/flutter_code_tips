import 'package:flutter/material.dart';

class BaselineScreen extends StatelessWidget {
  const BaselineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Baseline Screen'),
      ),
        body: const SizedBox(width: 100,height: 150,
          child: Baseline(
            baseline: 3,
            baselineType: TextBaseline.alphabetic,
            child: Center(child: Text('Hello baseline?'),),

        ),)
    );
  }
}
