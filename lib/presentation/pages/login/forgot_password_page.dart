import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                'Forgot Password?',
                style: TextStyle(
                  color: AppColors.primaryWhite,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
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
                    text: 'Send reset instructions',
                    onPressed: () {},
                  ),
                  SizedBox(height: Spacements.M),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.purpleAccent,
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
