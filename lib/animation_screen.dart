import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();
    startAnimation();
  }

  void startAnimation() {
     _animation = Tween(begin: 0.0, end: ln10).animate(
        CurvedAnimation(reverseCurve:Curves.bounceIn,
            parent: _animationController, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedBuilder(animation: _animationController, builder: (context,_){
                return Transform.rotate(angle: _animation.value,child: const FlutterLogo(),);
              }),
              OutlinedButton(
                onPressed: (){
                _animationController.isCompleted ? _animationController.reverse()
                    : _animationController.forward();
              },
                child: const Text('Start'),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
