import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:loomi/core/config/theme/theme.dart';
import 'core/config/app_routes.dart';
import 'core/di/dependency_injection.dart';
import 'presentation/controllers/movie_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  DependencyInjection.init();
  //Get.put(MovieController(getMoviesUseCase: Get.find()));

  runApp(
    GetMaterialApp(
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: Get.isRegistered<MovieController>() ? AppRoutes.home : AppRoutes.register,
      getPages: AppRoutes.routes,
    ),
  );
}
