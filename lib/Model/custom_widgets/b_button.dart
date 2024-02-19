import 'package:flutter/material.dart';

class BounceButton extends StatefulWidget {
  const BounceButton({
    super.key,
    required this.onTap,
    required this.cChild,
    required this.wHeight,
    required this.wWidth,
    required this.containerColor});


  final VoidCallback onTap;
  final Widget cChild;
  final double wHeight;
  final double wWidth;
  final Color containerColor;

  @override
  State<BounceButton> createState() => _BounceButtonState();
}

class _BounceButtonState extends State<BounceButton> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  double buttonScale = 1;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    buttonScale = 1- animationController.value;
    return GestureDetector(
      onTapDown: (_) => startAnimation(),
      onTapUp: (_){
        reverseAnimation();
        widget.onTap.call();
      },
      onTapCancel: () => reverseAnimation(),
      child: Transform.scale(
        scale: buttonScale,
        child: Container(
          height: widget.wHeight,
          width: widget.wWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: widget.containerColor
          ),
          child: Center(
            child: widget.cChild,
          ),
        ),
      ),
    );
  }

  void startAnimation() {
    animationController.forward();
  }

  void reverseAnimation() {
    animationController.reverse();
  }
}