import 'package:flutter/material.dart';
import 'package:flutter_ud/widget/gradient_container.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 63, 5, 120),
      body: GradientContainer(colors: [
        Color.fromARGB(255, 78, 13, 151),
        Color.fromARGB(255, 107, 159, 138),
      ])
    );
  }
}

 