import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LottieScreen(),
    );
  }
}

class LottieScreen extends StatelessWidget {
  const LottieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Анекдоты онлайнъ'),
      ),
      body: Center(
        child: Lottie.asset(
          'assets/animations/lottie_animation.json',
          width: 500,
          height: 500,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
