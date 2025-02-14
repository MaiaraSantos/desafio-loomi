import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loomi/presentation/pages/login/forgot_pass_feedback_page.dart';

import '../../../core/config/strings/strings.dart';
import '../../../core/config/theme/app_assets.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/spacements.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/cutom_primary_button.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.loomiSmallLogo),
              Text(
                Strings.forgotPassword,
                style: TextStyle(
                  color: AppColors.primaryWhite,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                Strings.emailToResetPassword,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.neutralGrayMiddle,
                  fontSize: 14,
                ),
              ),
              CustomTextField(
                hintText: Strings.email,
                keyboardType: TextInputType.text,
              ),
              Column(
                children: [
                  CustomPrimaryButton(
                    text: Strings.sendResetInstructions,
                    onPressed: () {
                      Get.to(ForgotPassFeedbackPage());
                      //TODO: implementar envio real
                    },
                  ),
                  SizedBox(height: Spacements.M),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      Strings.back,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
