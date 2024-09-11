import 'pages/home.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';

void main() {
  Logger log = Logger();
  log.d("Logger is working!");
  runApp(const MyApp());
}

