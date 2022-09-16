import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  GradientWidget({Key? key, required this.colors, required this.child})
      : super(key: key);
  List<Color> colors = [];
  Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) => LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: colors)
          .createShader(bounds),
      child: child,
    );
  }
}
