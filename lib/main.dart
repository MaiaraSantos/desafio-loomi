import 'package:flutter/material.dart';
import 'package:loomi/core/config/theme/theme.dart';

import 'core/di/di.dart';
import 'presentation/pages/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home: HomeScreen(),
    );
  }
}
