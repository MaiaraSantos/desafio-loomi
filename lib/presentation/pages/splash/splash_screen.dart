import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi/core/config/theme/app_colors.dart';
import '../../../core/config/theme/app_assets.dart';
import '../../controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralBlackProcess, // Cor de fundo da Splash
      body: Center(
        child: SvgPicture.asset(
          AppAssets.loomiSmallLogo,
          width: 150,
          colorFilter: ColorFilter.mode(
            AppColors.primaryWhite,
            BlendMode.srcIn,
          ),
        ), // Logo da Loomi
      ),
    );
  }
}
