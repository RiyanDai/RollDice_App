import 'package:flutter/material.dart';
import 'package:flutter_ud/widget/style_text.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> with TickerProviderStateMixin {
  int currentDiceNumber = 1;
  final randomizer = Random();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void rollDice() {
    if (!_controller.isAnimating) {
      setState(() {
        currentDiceNumber = randomizer.nextInt(6) + 1;
      });
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _animation.value * 4 * 3.14159,
              child: Image.asset(
                'assets/images/dice$currentDiceNumber.png',
                width: 200,
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          child: const StyledText(text: "Roll Dice"),
        ),
      ],
    );
  }
}