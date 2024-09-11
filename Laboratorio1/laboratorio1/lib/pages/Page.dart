import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({super.key, required this.title, required this.buttons});
  final String title;
  final List<ElevatedButton> buttons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title)
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text('FELIZ 18'),
            ]
          )
        ),
        persistentFooterButtons: buttons,
    );
  }
}