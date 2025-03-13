import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final TextAlign? alignment;
  final TextStyle? style;

  const SectionTitle({
    super.key,
    required this.title,
    this.alignment,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alignment ?? TextAlign.left,
      style: style ??
          Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
    );
  }
}
