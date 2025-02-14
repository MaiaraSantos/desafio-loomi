import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:loomi/core/config/theme/theme.dart';
import 'core/config/app_routes.dart';
import 'core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  DependencyInjection.init();

  runApp(
    GetMaterialApp(
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppRoutes.routes,
    ),
  );
}
