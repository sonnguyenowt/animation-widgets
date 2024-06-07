import 'package:flutter/material.dart';

class ShakeWidget extends StatefulWidget {
  final Widget child;

  final Duration duration;

  final bool repeat;

  final double amplitude;

  final Axis? direction;

  final Curve curve;

  const ShakeWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.repeat = false,
    this.amplitude = 10,
    this.curve = Curves.fastOutSlowIn,
    this.direction,
  });

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: -widget.amplitude, end: widget.amplitude).chain(
          CurveTween(curve: widget.curve),
        ),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: widget.amplitude, end: -widget.amplitude).chain(
          CurveTween(curve: widget.curve),
        ),
        weight: 1,
      ),
    ]).animate(_animationController);

    _startAnimation();
  }

  void _startAnimation() {
    if (widget.repeat) {
      _animationController.repeat();
    } else {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        late Offset offset;
        if (widget.direction == Axis.horizontal) {
          offset = Offset(_animation.value, 0);
        } else if (widget.direction == Axis.vertical) {
          offset = Offset(0, _animation.value);
        } else {
          offset = Offset(_animation.value, _animation.value);
        }
        return Transform.translate(
          offset: offset,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
