import 'package:flutter/material.dart';

class ModifiedText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;
  const ModifiedText({
    super.key,
    required this.text,
    this.size = 11,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color ?? Theme.of(context).textTheme.bodyLarge!.color,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
