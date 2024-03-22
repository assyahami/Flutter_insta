import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Likes extends StatefulWidget {
  const Likes({super.key});

  @override
  _LikesState createState() => _LikesState();
}

class _LikesState extends State<Likes> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 24.0, end: 36.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  void _animateIcon() {
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: GestureDetector(
          child: const Icon(
            Icons.favorite,
            size: 70,
            color: Colors.white,
          ),
          onTap: () {},
        ));
  }
}
