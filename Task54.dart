import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedShapeScreen(),
    );
  }
}

class AnimatedShapeScreen extends StatefulWidget{
  @override
  _AnimatedShapeScreenState createState() => _AnimatedShapeScreenState();
}

class _AnimatedShapeScreenState extends State<AnimatedShapeScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _radiusAnimation;
  late Animation<Color?> _colorAnimation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller =  AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _sizeAnimation = Tween<double>(
      begin: 200,
      end: 250,
    ).animate(_controller);

    _radiusAnimation = Tween<double>(
      begin: 0,
      end: 20,
    ).animate(_controller);

    _colorAnimation = ColorTween(
        begin: Colors.red,
        end: Colors.blue,
    ).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  void _toggleAnimation() {
    if (_isExpanded) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _isExpanded = !_isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('анекдоты онлайн')),
      body: Center(
        child: Column(
          children: [
            Container(
              width: _isExpanded ? 250 : _sizeAnimation.value,
              height: _isExpanded ? 350 : _sizeAnimation.value,
              decoration: BoxDecoration(
                color: _colorAnimation.value,
                borderRadius: BorderRadius.circular(_radiusAnimation.value),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () { _toggleAnimation(); },
                child: Text('Click!')),
          ],
        ),
      ),
    );
  }
}
