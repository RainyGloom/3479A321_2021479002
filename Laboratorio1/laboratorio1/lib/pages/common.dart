import 'package:flutter/material.dart';

void goingTo(BuildContext context, Widget page)
{
  Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}