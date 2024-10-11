import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({super.key, required this.title, required this.body, required this.drawer});
  final String title;
  final Widget body;
  final Widget drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title)
        ),
        body: body,
        drawer: drawer,
    );
  }
}