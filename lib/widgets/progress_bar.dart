import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatelessWidget {
  const AnimatedProgressBar({super.key, required this.value, this.height = 12});

  final double value;
  final double height;

  @override
  Widget build(BuildContext context) {
    // Round negative and missing values to min value
    _floor(double value, [min = 0.0]) {
      return value.sign <= min ? min : value;
    }

    // Color genetator to progress bar from green to red
    _colorGen(double value) {
      int rbg = (value * 255).toInt();
      return Colors.deepOrange.withGreen(rbg).withRed(255 - rbg);
    }

    return LayoutBuilder(
      builder: (ctx, box) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: box.maxWidth,
          child: Stack(
            children: [
              Container(
                height: height,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.all(Radius.circular(height)),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
                height: height,
                width: box.maxWidth * _floor(value),
                decoration: BoxDecoration(
                  color: _colorGen(value),
                  borderRadius: BorderRadius.all(Radius.circular(height)),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
