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
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;
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

    final CurvedAnimation curve = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _widthAnimation = Tween<double>(begin: 200, end: 250).animate(
      CurvedAnimation(
        parent: curve,
        curve: Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );

    _heightAnimation = Tween<double>(begin: 200, end: 350).animate(
      CurvedAnimation(
        parent: curve,
        curve: Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );

    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
      CurvedAnimation(
        parent: curve,
        curve: Interval(0.3, 0.65, curve: Curves.easeInOut),
      ),
    );

    _radiusAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: curve,
        curve: Interval(0.65, 1.0, curve: Curves.easeInOut),
      ),
    );

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
              width: _widthAnimation.value,
              height: _heightAnimation.value,
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
