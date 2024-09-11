import 'package:flutter/material.dart';

class SizedRow extends StatelessWidget {
  const SizedRow({required this.width, required this.height, required this.children, required this.childAlignment});
  final double width;
  final double height;
  final MainAxisAlignment childAlignment;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(mainAxisAlignment: childAlignment, children: children)
    );
  }
}