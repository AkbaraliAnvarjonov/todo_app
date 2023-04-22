import 'package:flutter/material.dart';

class ZoomTapAnimation extends StatefulWidget {
  final Widget child;
  final Function onTap;

  const ZoomTapAnimation({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  _ZoomTapAnimationState createState() => _ZoomTapAnimationState();
}

class _ZoomTapAnimationState extends State<ZoomTapAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () {
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _animation,
        child: widget.child,
      ),
    );
  }
}
