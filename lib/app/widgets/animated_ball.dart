import 'package:flutter/material.dart';

class AnimatedBall extends StatefulWidget {
  const AnimatedBall({super.key,
  required this.radius
  });

  final double radius;
  @override
  State<AnimatedBall> createState() => _AnimatedBallState();
}

class _AnimatedBallState extends State<AnimatedBall> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800)
      );

      _animation = Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _animationStart (){
    setState(() {
        _animationController.reset();
        _animationController.forward();
  });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _animationStart,
      child: CircleAvatar(
        radius: widget.radius,
        backgroundColor: const Color.fromARGB(255, 199, 158, 215),
        child: CircleAvatar(radius: widget.radius/2,
          backgroundColor: const Color.fromARGB(255,235,220,240),
          child: RotationTransition(
            turns: _animation,
            child: Text('8',
            style: TextStyle(fontSize: widget.radius/2, color: const Color.fromARGB(255, 199, 158, 215)),
            ),
          ),
      )),
    );
  }
}