import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingSpinner extends StatelessWidget {
  final String? message;

  final double? height;
  final double? width;
  Color? color;

  LoadingSpinner({
    Key? key,
    this.message,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 20,
      width: width ?? 20,
      child: LoadingIndicator(
        indicatorType: Indicator.lineSpinFadeLoader,
        colors: [color??Theme.of(context).colorScheme.secondary],
      ),
    );
  }
}