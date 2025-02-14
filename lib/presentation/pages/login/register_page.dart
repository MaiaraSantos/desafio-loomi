import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loomi/core/config/theme/app_colors.dart';
import 'package:loomi/core/config/theme/spacements.dart';
import '../../controllers/auth_controller.dart';
import '../../../core/config/theme/app_assets.dart';
import '../../../core/config/strings/strings.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/cutom_primary_button.dart';
import '../../widgets/social_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacements.M),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Spacements.M),
                SvgPicture.asset(AppAssets.loomiLogo),
                SizedBox(height: Spacements.S),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.alreadyHaveAccount,
                      style: TextStyle(
                        color: AppColors.neutralGrayMiddle,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: Spacements.XS),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/login');
                      },
                      child: Text(
                        Strings.signIn,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Spacements.XL),
                Text(
                  Strings.createAnAccount,
                  style: TextStyle(
                    color: AppColors.primaryWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Spacements.M),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      iconPath: AppAssets.googleIcon,
                      onTap: () {
                        authController.loginWithGoogle();
                      },
                    ),
                  ],
                ),
                SizedBox(height: Spacements.M),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.neutralGrayMiddle,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Spacements.XS),
                      child: Text(
                        Strings.signUpWith,
                        style: TextStyle(
                          color: AppColors.primaryWhite.withAlpha(204),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.neutralGrayMiddle,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Spacements.M),
                CustomTextField(
                  controller: emailController,
                  hintText: Strings.email,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: Spacements.S),
                CustomTextField(
                    controller: passwordController,
                    hintText: Strings.password,
                    keyboardType: TextInputType.text,
                    isPassword: true),
                SizedBox(height: Spacements.S),
                CustomTextField(
                    controller: confirmPasswordController,
                    hintText: Strings.confirmPassword,
                    keyboardType: TextInputType.text,
                    isPassword: true),
                SizedBox(height: Spacements.M),
                CustomPrimaryButton(
                  text: Strings.createAccount,
                  onPressed: () {
                    authController.registerWithEmail(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      confirmPasswordController.text.trim(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
