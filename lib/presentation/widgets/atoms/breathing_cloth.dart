import 'package:flutter/material.dart';

class BreathingCloth extends StatefulWidget {
  final double size;
  final Animation<double>? animation;
  final Animation<double>? scaleAnimation;

  const BreathingCloth({
    super.key,
    required this.size,
    this.animation,
    this.scaleAnimation,
  });

  @override
  State<BreathingCloth> createState() => _BreathingClothState();
}

class _BreathingClothState extends State<BreathingCloth>
    with SingleTickerProviderStateMixin {
  late AnimationController _breathingController;
  late Animation<double> _breathingAnimation;

  @override
  void initState() {
    super.initState();
    _breathingController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _breathingAnimation =
        Tween<double>(
          begin: 1.0,
          end: 1.12, // Crece un 12% para ser más sutil
        ).animate(
          CurvedAnimation(
            parent: _breathingController,
            curve: Curves.elasticOut,
          ),
        );

    _breathingController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _breathingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _breathingAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _breathingAnimation.value,
          child: Opacity(
            opacity: widget.animation?.value.clamp(0.0, 1.0) ?? 1.0,
            child: Image.asset(
              'assets/welcome/cloth.png',
              width: widget.size,
              height: widget.size,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
