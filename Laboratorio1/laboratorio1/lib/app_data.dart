import 'package:flutter/material.dart';

class AppData extends ChangeNotifier
{
  AppData() : count = 0, actions = [];

  int count;
  List<String> actions;

  void incrementCounter() 
  {
    count++;
  }

  void decreaseCount()
  {
    count--;
  }

  void reset()
  {
    count = 0;
  }
}