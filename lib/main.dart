import 'package:flutter/material.dart';

import 'locator.dart';
import 'ui/views/home_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: HomeView()),
    );
  }
}
