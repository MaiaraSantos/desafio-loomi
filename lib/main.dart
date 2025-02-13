import 'package:flutter/material.dart';
import 'package:loomi/core/config/theme/theme.dart';
import 'package:loomi/presentation/pages/login/register_page.dart';

import 'presentation/pages/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      home: HomeScreen(),
    );
  }
}
