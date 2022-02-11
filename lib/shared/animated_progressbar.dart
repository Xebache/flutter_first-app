import 'package:flutter/material.dart';

class AnimatedProgressbar extends StatelessWidget {
  final double value;
  final double height;

  const AnimatedProgressbar({Key? key, required this.value, this.height = 12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        padding: const EdgeInsets.all(10),
        width: constraints.maxWidth,
        child: Stack(
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(height),
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutCubic,
              height: height,
              width: constraints.maxWidth * _floor(value),
              decoration: BoxDecoration(
                color: _colorGen(value),
                borderRadius: BorderRadius.all(
                  Radius.circular(height),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  _floor(double value, [min = 0.0]) {
    return value.sign <= min ? min : value;
  }

  _colorGen(double value) {
    int rbg = (value * 255).toInt();
    return Colors.deepOrange.withGreen(rbg).withRed(255 - rbg);
  }
}
