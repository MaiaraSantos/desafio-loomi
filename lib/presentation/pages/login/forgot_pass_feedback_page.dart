import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loomi/presentation/pages/login/login_page.dart';

import '../../../core/config/strings/strings.dart';
import '../../../core/config/theme/app_assets.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/spacements.dart';
import '../../widgets/cutom_primary_button.dart';

class ForgotPassFeedbackPage extends StatelessWidget {
  const ForgotPassFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppAssets.loomiSmallLogo),
              Column(
                children: [
                  Text(
                    Strings.theInstructionsWereSent,
                    style: TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Spacements.M),
                  Text(
                    Strings.pleaseCheckYourEmail,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.neutralGrayMiddle,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CustomPrimaryButton(
                    text: Strings.login,
                    onPressed: () {
                      Get.to(LoginPage());
                    },
                  ),
                  SizedBox(height: Spacements.M),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
